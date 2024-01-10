import 'package:dio/dio.dart';
import 'package:simple_news/core/data/mock_data.dart';
import 'package:simple_news/features/articles/data/models/article_model.dart';
import 'package:simple_news/features/articles/data/models/response_wrapper.dart';
import 'package:simple_news/features/articles/data/models/source_model.dart';

final requestOptions = RequestOptions();
final unauthorizedException = DioException.badResponse(
  statusCode: 401,
  requestOptions: requestOptions,
  response: Response(
    requestOptions: requestOptions,
    statusCode: 401,
    statusMessage: 'Unauthorized',
  ),
);

SourceModel createSourceModel({
  String? id = sourceId,
  String name = sourceName,
  String? description,
}) =>
    SourceModel(
      id: id,
      name: name,
      description: description,
    );

ArticleModel createArticleModel({
  String? title = articleTitle,
  String? author = sourceName,
  String? description = articleDescription,
  String? content = articleContent,
  SourceModel? source,
}) =>
    ArticleModel(
      title: title,
      author: author,
      description: description,
      content: content,
    );

ArticlesResponseWrapper createArticlesResponseWrapper([
  List<ArticleModel>? articles,
]) =>
    ArticlesResponseWrapper(articles ?? [createArticleModel()]);

SourcesResponseWrapper createSourcesResponseWrapper([
  List<SourceModel>? sources,
]) =>
    SourcesResponseWrapper(sources ?? [createSourceModel()]);
