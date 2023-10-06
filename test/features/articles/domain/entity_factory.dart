import 'package:simple_news/features/articles/domain/entities/article.dart';
import 'package:simple_news/features/articles/domain/entities/source.dart';

import '../../../core/mock_data.dart';

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
  Source? source,
}) =>
    Article(
      title: title,
      author: author,
      description: description,
      content: content,
      source: source ?? createSource(),
    );
