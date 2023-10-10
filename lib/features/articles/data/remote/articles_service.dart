import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/data/remote_config.dart';
import '../models/response_wrapper.dart';

part 'articles_service.g.dart';

@Riverpod(keepAlive: true)
ArticlesService articlesService(ArticlesServiceRef ref) {
  final dio = ref.watch(dioProvider);
  return ArticlesService(dio);
}

@RestApi()
abstract class ArticlesService {
  factory ArticlesService(Dio dio) = _ArticlesService;

  @GET('/')
  Future<ArticlesResponseWrapper> getTopArticlesBySourceId(
    @Query('sources') String sourceId,
  );

  @GET('/sources')
  Future<SourcesResponseWrapper> getSources();
}
