import 'package:simple_news/core/data/mock_data.dart';
import 'package:simple_news/features/articles/domain/entities/article.dart';
import 'package:simple_news/features/articles/domain/entities/source.dart';

Source createSource({
  String? id = sourceId,
  String name = sourceName,
  String? description,
}) =>
    Source(
      id: id,
      name: name,
      description: description,
    );

Article createArticle({
  String? title = articleTitle,
  String? author = sourceName,
  String? description = articleDescription,
  String? content = articleContent,
}) =>
    Article(
      title: title,
      author: author,
      description: description,
      content: content,
    );
