import 'package:freezed_annotation/freezed_annotation.dart';

import 'article_model.dart';
import 'source_model.dart';

part 'response_wrapper.freezed.dart';
part 'response_wrapper.g.dart';

@freezed
class ArticlesResponseWrapper with _$ArticlesResponseWrapper {
  const factory ArticlesResponseWrapper(
    List<ArticleModel> articles,
  ) = _ArticlesResponseWrapper;

  factory ArticlesResponseWrapper.fromJson(Map<String, dynamic> json) =>
      _$ArticlesResponseWrapperFromJson(json);
}

@freezed
class SourcesResponseWrapper with _$SourcesResponseWrapper {
  const factory SourcesResponseWrapper(
    List<SourceModel> sources,
  ) = _SourcesResponseWrapper;

  factory SourcesResponseWrapper.fromJson(Map<String, dynamic> json) =>
      _$SourcesResponseWrapperFromJson(json);
}
