import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:simple_news/core/data/mock_data.dart';
import 'package:simple_news/core/data/remote_config.dart';
import 'package:simple_news/features/articles/data/data_sources/articles_remote_service.dart';
import 'package:simple_news/features/articles/data/models/article_model.dart';
import 'package:simple_news/features/articles/data/models/response_wrapper.dart';
import 'package:simple_news/features/articles/data/models/source_model.dart';

void main() {
  group('articles service', () {
    late Dio dio;
    late DioAdapter dioAdapter;
    late ArticlesRemoteService service;

    setUp(() {
      dio = RemoteConfig.buildDioClient();
      dioAdapter = DioAdapter(dio: dio);
      service = ArticlesRemoteService(dio);
    });

    stubDio({
      required String path,
      required Map<String, dynamic> data,
      Map<String, dynamic>? queryParameters,
      int statusCode = 200,
    }) {
      dioAdapter.onGet(
        path,
        (server) => server.reply(statusCode, data),
        headers: RemoteConfig.authorizationHeaders,
        queryParameters: queryParameters,
      );
    }

    group('get top articles by source id', () {
      test('should return a list of articles', () async {
        stubDio(path: '/', data: getTopArticlesBySourceResponse);

        final response = await service.getTopArticlesBySourceId('sourceId');

        expect(
          response,
          isA<ArticlesResponseWrapper>().having(
            (p0) => p0.articles,
            'list',
            isA<List<ArticleModel>>(),
          ),
        );
      });
    });

    group('get sources', () {
      test('should return a list of sources', () async {
        stubDio(path: '/sources', data: getSourcesResponse);

        final response = await service.getSources();

        expect(
          response,
          isA<SourcesResponseWrapper>().having(
            (p0) => p0.sources,
            'sources',
            isA<List<SourceModel>>(),
          ),
        );
      });
    });
  });
}
