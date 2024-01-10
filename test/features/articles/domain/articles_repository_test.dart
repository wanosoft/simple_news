import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_news/core/data/mock_data.dart';
import 'package:simple_news/features/articles/domain/articles_repository.dart';
import 'package:simple_news/features/articles/domain/entities/article.dart';
import 'package:simple_news/features/articles/domain/entities/source.dart';

import 'entity_factory.dart';

class MockArticlesRepository extends Mock implements ArticlesRepository {}

void main() {
  group('articles repository', () {
    late ArticlesRepository articlesRepository;
    late ProviderContainer container;

    setUp(() {
      articlesRepository = MockArticlesRepository();
      container = ProviderContainer(
        overrides: [
          articlesRepositoryProvider.overrideWithValue(articlesRepository),
        ],
      );
    });

    test('should get top articles by source id', () async {
      final expected = [createArticle()];

      when(() => articlesRepository.getTopArticlesBySourceId(sourceId))
          .thenAnswer((_) async => expected);

      expect(
        container.read(getTopArticlesBySourceIdProvider(sourceId)),
        const AsyncValue<List<Article>>.loading(),
      );

      await container.read(getTopArticlesBySourceIdProvider(sourceId).future);

      expect(
        container.read(getTopArticlesBySourceIdProvider(sourceId)).value,
        expected,
      );
    });

    test('should get available sources', () async {
      final expected = [createSource(description: 'description')];

      when(() => articlesRepository.getSources())
          .thenAnswer((_) async => expected);

      expect(
        container.read(getSourcesProvider),
        const AsyncValue<List<Source>>.loading(),
      );

      await container.read(getSourcesProvider.future);

      expect(
        container.read(getSourcesProvider).value,
        expected,
      );
    });
  });
}
