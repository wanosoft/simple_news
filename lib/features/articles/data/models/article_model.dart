import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/article.dart';

part 'article_model.freezed.dart';
part 'article_model.g.dart';

/// This object represents an article fetched by the remote
@freezed
class ArticleModel with _$ArticleModel {
  const ArticleModel._();

  const factory ArticleModel({
    required String? title,
    required String? author,
    required String? description,
    required String? content,
  }) = _ArticleModel;

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Article toArticle() => Article(
        title: title,
        author: author,
        description: description,
        content: content,
      );
}
