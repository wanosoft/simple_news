import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required String? title,
    required String? author,
    required String? description,
    required String? content,
  }) = _Article;
}
