import 'dart:convert';

import 'package:drift/drift.dart';

import 'article_model.dart';

class _ArticlesConverter extends TypeConverter<ArticleModel, String> {
  @override
  ArticleModel fromSql(String fromDb) {
    return ArticleModel.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(ArticleModel value) {
    return json.encode(value.toJson());
  }
}

/// Articles table definition, used to save articles in local storage.
@DataClassName('Articles')
class Articles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get data => text().map(_ArticlesConverter())();
}
