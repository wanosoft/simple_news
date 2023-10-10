import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_news/core/domain/entities/failure.dart';
import 'package:simple_news/features/articles/data/articles_repository_impl.dart';
import 'package:simple_news/features/articles/data/data_sources/articles_local_service.dart';
import 'package:simple_news/features/articles/data/data_sources/articles_remote_service.dart';
import 'package:simple_news/features/articles/domain/entities/article.dart';
import 'package:simple_news/features/articles/domain/entities/source.dart';

import '../../../core/mock_data.dart';
import '../domain/entity_factory.dart';
import 'model_factory.dart';

class MockArticlesRemoteService extends Mock implements ArticlesRemoteService {}

class MockArticlesLocalService extends Mock implements ArticlesLocalService {}

void main() {
  group('articles repository impl', () {
    late ArticlesRemoteService remoteService;
    late ArticlesLocalService localService;
    late ArticlesRepositoryImpl articlesRepositoryImpl;

    setUp(() {
      remoteService = MockArticlesRemoteService();
      localService = MockArticlesLocalService();
      articlesRepositoryImpl =
          ArticlesRepositoryImpl(remoteService, localService);
    });

    group('get top articles by source id', () {
      test('should return a list of articles', () async {
        when(
          () => remoteService.getTopArticlesBySourceId(sourceId),
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

      test('should throw a failure', () async {
        when(() => remoteService.getTopArticlesBySourceId(sourceId))
            .thenThrow(unauthorizedException);

        expectLater(
          articlesRepositoryImpl.getTopArticlesBySourceId(sourceId),
          throwsA(isA<UnauthorizedFailure>()),
        );
      });
    });

    group('get sources', () {
      test('should return a list of article sources', () async {
        when(() => remoteService.getSources()).thenAnswer(
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

      test('should throw a failure', () async {
        when(() => remoteService.getSources()).thenThrow(unauthorizedException);

        expectLater(
          articlesRepositoryImpl.getSources(),
          throwsA(isA<UnauthorizedFailure>()),
        );
      });
    });

    group('get all saved articles', () {
      test('should return a list of saved articles', () async {
        when(() => localService.getAllSavedArticles()).thenAnswer(
          (_) async => [createArticleModel()],
        );

        final result = await articlesRepositoryImpl.getAllSavedArticles();

        expect(
          result,
          isA<List<Article>>().having(
            (p0) => p0.first,
            'only article',
            createArticle(),
          ),
        );
      });

      test('should throw a failure', () async {
        when(() => localService.getAllSavedArticles()).thenThrow(Exception());

        expectLater(
          articlesRepositoryImpl.getSources(),
          throwsA(isA<UnknownFailure>()),
        );
      });
    });

    group('article is already saved', () {
      test('should return true if article is in the local database', () async {
        when(() => localService.articleIsAlreadySaved(createArticleModel()))
            .thenAnswer(
          (_) async => true,
        );

        final result =
            await articlesRepositoryImpl.articleIsAlreadySaved(createArticle());

        expect(result, true);
      });

      test('should return false if article is not in the local database',
          () async {
        when(() => localService.articleIsAlreadySaved(createArticleModel()))
            .thenAnswer(
          (_) async => false,
        );

        final result =
            await articlesRepositoryImpl.articleIsAlreadySaved(createArticle());

        expect(result, false);
      });

      test('should throw a failure', () async {
        when(() => localService.articleIsAlreadySaved(createArticleModel()))
            .thenThrow(Exception());

        expectLater(
          articlesRepositoryImpl.articleIsAlreadySaved(createArticle()),
          throwsA(isA<UnknownFailure>()),
        );
      });
    });

    group('save article', () {
      test('should save article in the local database', () async {
        when(() => localService.saveArticle(createArticleModel())).thenAnswer(
          (_) async => 1,
        );

        await articlesRepositoryImpl.saveArticle(createArticle());

        verify(() => localService.saveArticle(createArticleModel())).called(1);
        verifyNoMoreInteractions(localService);
      });

      test('should throw a failure', () async {
        when(() => localService.articleIsAlreadySaved(createArticleModel()))
            .thenThrow(Exception());

        expectLater(
          articlesRepositoryImpl.articleIsAlreadySaved(createArticle()),
          throwsA(isA<UnknownFailure>()),
        );
      });
    });
  });
}
