import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/data/local_config.dart';
import '../models/article_model.dart';

part 'articles_local_service.g.dart';

@Riverpod(keepAlive: true)
ArticlesLocalService articlesLocalService(ArticlesLocalServiceRef ref) {
  final database = ref.watch(simpleNewsDatabaseProvider);
  return ArticlesLocalService(database);
}

class ArticlesLocalService {
  const ArticlesLocalService(this._database);

  final SimpleNewsDatabase _database;

  Future<bool> articleIsAlreadySaved(ArticleModel articleModel) async {
    try {
      final savedArticles = _database.select(_database.articles)
        ..where(
            (table) => table.data.equals(json.encode(articleModel.toJson())));
      final article = await savedArticles.getSingleOrNull();

      return article != null;
    } catch (e) {
      return false;
    }
  }

  Future<List<ArticleModel>> getAllSavedArticles() async {
    final articles = await _database.select(_database.articles).get();
    return articles.map((a) => a.data).toList();
  }

  Future<int> saveArticle(ArticleModel articleModel) async =>
      await _database.into(_database.articles).insert(
            ArticlesCompanion.insert(data: articleModel),
            mode: InsertMode.insertOrReplace,
          );

  Future<int> deleteArticle(ArticleModel articleModel) async =>
      await _database.articles.deleteWhere(
        (table) => table.data.equalsValue(articleModel),
      );
}
