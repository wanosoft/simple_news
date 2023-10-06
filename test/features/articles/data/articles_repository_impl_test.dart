import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_news/features/articles/data/articles_repository_impl.dart';
import 'package:simple_news/features/articles/data/remote/articles_service.dart';
import 'package:simple_news/features/articles/domain/entities/article.dart';
import 'package:simple_news/features/articles/domain/entities/source.dart';

import '../../../core/mock_data.dart';
import '../domain/entity_factory.dart';
import 'model_factory.dart';

class MockArticlesService extends Mock implements ArticlesService {}

void main() {
  group('articles repository impl', () {
    late ArticlesService articlesService;
    late ArticlesRepositoryImpl articlesRepositoryImpl;

    setUp(() {
      articlesService = MockArticlesService();
      articlesRepositoryImpl = ArticlesRepositoryImpl(articlesService);
    });

    group('get top articles by source id', () {
      test('should return a list of articles', () async {
        when(
          () => articlesService.getTopArticlesBySourceId(sourceId),
        ).thenAnswer(
          (_) async => createArticlesResponseWrapper(),
        );

        final result =
            await articlesRepositoryImpl.getTopArticlesBySourceId(sourceId);

        expect(
          result,
          isA<List<Article>>().having(
            (p0) => p0.first,
            'first article',
            createArticle(),
          ),
        );
      });
    });

    group('get sources', () {
      test('should return a list of article sources', () async {
        when(() => articlesService.getSources()).thenAnswer(
          (_) async => createSourcesResponseWrapper(),
        );

        final result = await articlesRepositoryImpl.getSources();

        expect(
          result,
          isA<List<Source>>().having(
            (p0) => p0.first,
            'first source',
            createSource(),
          ),
        );
      });
    });
  });
}
