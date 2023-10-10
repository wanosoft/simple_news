import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_news/core/data/local_config.dart';
import 'package:simple_news/features/articles/data/data_sources/articles_local_service.dart';

import '../model_factory.dart';

void main() {
  late SimpleNewsDatabase database;
  late ArticlesLocalService articlesLocalService;

  setUp(() {
    database = SimpleNewsDatabase(NativeDatabase.memory());
    articlesLocalService = ArticlesLocalService(database);
  });

  tearDown(() => database.close());

  group('articles local service', () {
    test('should save article', () async {
      final article = createArticleModel();

      final result = await articlesLocalService.saveArticle(article);

      expect(result, 1);
    });

    test('should get all saved articles', () async {
      final article1 = createArticleModel();
      final article2 = createArticleModel(description: 'New article');

      await articlesLocalService.saveArticle(article1);
      await articlesLocalService.saveArticle(article2);

      final result = await articlesLocalService.getAllSavedArticles();

      expect(result, [article1, article2]);
    });

    test('should return true if article is already saved', () async {
      final article = createArticleModel();

      await articlesLocalService.saveArticle(article);

      final result = await articlesLocalService.articleIsAlreadySaved(article);

      expect(result, true);
    });

    test('should delete article', () async {
      final article = createArticleModel();

      await articlesLocalService.saveArticle(article);

      final deleteResult = await articlesLocalService.deleteArticle(article);

      expect(deleteResult, true);

      final result = await articlesLocalService.getAllSavedArticles();

      expect(result, isEmpty);
    });
  });
}
