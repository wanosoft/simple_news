import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/data/remote_config.dart';
import '../models/response_wrapper.dart';

part 'articles_remote_service.g.dart';

@Riverpod(keepAlive: true)
ArticlesRemoteService articlesRemoteService(ArticlesRemoteServiceRef ref) {
  final dio = ref.watch(dioProvider);
  return ArticlesRemoteService(dio);
}

@RestApi()
abstract class ArticlesRemoteService {
  factory ArticlesRemoteService(Dio dio) = _ArticlesRemoteService;

  @GET('/')
  Future<ArticlesResponseWrapper> getTopArticlesBySourceId(
    @Query('sources') String sourceId,
  );

  @GET('/sources')
  Future<SourcesResponseWrapper> getSources();
}
