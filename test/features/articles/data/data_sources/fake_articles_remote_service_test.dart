import 'package:flutter_test/flutter_test.dart';
import 'package:simple_news/core/data/mock_data.dart';
import 'package:simple_news/features/articles/data/data_sources/fake_articles_remote_service.dart';
import 'package:simple_news/features/articles/data/models/response_wrapper.dart';

import '../model_factory.dart';

void main() {
  group('fake articles remote service', () {
    late FakeArticlesRemoteService fakeArticlesRemoteService;

    group('should succeed', () {
      late ArticlesResponseWrapper articlesResponseWrapper;
      late SourcesResponseWrapper sourcesResponseWrapper;

      setUp(() {
        articlesResponseWrapper = createArticlesResponseWrapper();
        sourcesResponseWrapper = createSourcesResponseWrapper();
        fakeArticlesRemoteService = FakeArticlesRemoteService(
          delayDuration: const Duration(milliseconds: 500),
          articlesResponseWrapperResolver: () => articlesResponseWrapper,
          sourcesResponseWrapperResolver: () => sourcesResponseWrapper,
        );
      });

      test('getSources should return a source', () async {
        final result = await fakeArticlesRemoteService.getSources();
        expect(result, sourcesResponseWrapper);
      });

      test('getTopArticlesBySourceId should return an article', () async {
        final result = await fakeArticlesRemoteService.getTopArticlesBySourceId(
          sourceId,
        );
        expect(result, articlesResponseWrapper);
      });
    });

    group('should fail', () {
      late Exception exception;

      setUp(() {
        exception = Exception();
        fakeArticlesRemoteService = FakeArticlesRemoteService(
          delayDuration: const Duration(milliseconds: 500),
          articlesResponseWrapperResolver: () => throw exception,
          sourcesResponseWrapperResolver: () => throw exception,
        );
      });

      test(
        'getSources should throw an exception',
        () => expectLater(
          fakeArticlesRemoteService.getSources(),
          throwsA(exception),
        ),
      );

      test(
        'getTopArticlesBySourceId should throw an exception',
        () => expectLater(
          fakeArticlesRemoteService.getTopArticlesBySourceId(sourceId),
          throwsA(exception),
        ),
      );
    });
  });
}
