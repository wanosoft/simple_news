import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_news/features/articles/domain/articles_repository.dart';
import 'package:simple_news/features/articles/presentation/saved_articles_state.dart';

import '../../../testing_utils.dart';
import '../domain/articles_repository_test.dart';
import '../domain/entity_factory.dart';

void main() {
  late MockArticlesRepository articlesRepository;
  late ProviderContainer container;

  setUp(() {
    articlesRepository = MockArticlesRepository();

    container = createContainer(
      overrides: [
        articlesRepositoryProvider.overrideWith((ref) => articlesRepository),
      ],
    );
  });

  group('saved articles state notifier', () {
    test('should return saved articles', () async {
      final expected = [createArticle()];

      when(
        () => articlesRepository.getAllSavedArticles(),
      ).thenAnswer((_) async => expected);

      final result =
          await container.read(savedArticlesStateProvider.notifier).build();

      expect(result, expected);
      verify(() => articlesRepository.getAllSavedArticles()).called(1);
      verifyNoMoreInteractions(articlesRepository);
    });

    test('should add a new article to the state', () async {
      final article = createArticle();
      final expected = [article];

      when(
        () => articlesRepository.getAllSavedArticles(),
      ).thenAnswer((_) async => []);
      when(
        () => articlesRepository.saveArticle(article),
      ).thenAnswer((_) async => {});

      final initialState =
          await container.read(savedArticlesStateProvider.notifier).build();

      expect(initialState, isEmpty);

      await container
          .read(savedArticlesStateProvider.notifier)
          .addArticle(article);

      final result = container.read(savedArticlesStateProvider.notifier).state;

      expect(result.asData!.value, expected);

      verify(() => articlesRepository.saveArticle(article)).called(1);
      verify(() => articlesRepository.getAllSavedArticles()).called(1);
      verifyNoMoreInteractions(articlesRepository);
    });

    test('should remove an article from the state', () async {
      final article = createArticle();
      final expected = [article];

      when(
        () => articlesRepository.getAllSavedArticles(),
      ).thenAnswer((_) async => expected);
      when(
        () => articlesRepository.deleteArticle(article),
      ).thenAnswer((_) async {});

      final initialState =
          await container.read(savedArticlesStateProvider.notifier).build();

      expect(initialState, expected);

      await container
          .read(savedArticlesStateProvider.notifier)
          .removeArticle(article);

      final result = container.read(savedArticlesStateProvider.notifier).state;

      expect(result.asData!.value, []);

      verify(() => articlesRepository.getAllSavedArticles()).called(1);
      verify(() => articlesRepository.deleteArticle(article)).called(1);
      verifyNoMoreInteractions(articlesRepository);
    });
  });
}
