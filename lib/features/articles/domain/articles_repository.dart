import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/articles_repository_impl.dart';
import '../data/remote/articles_service.dart';
import 'entities/article.dart';
import 'entities/source.dart';

part 'articles_repository.g.dart';

@Riverpod(keepAlive: true)
ArticlesRepository articlesRepository(ArticlesRepositoryRef ref) {
  final articlesService = ref.watch(articlesServiceProvider);
  return ArticlesRepositoryImpl(articlesService);
}

@riverpod
Future<List<Source>> getSources(GetSourcesRef ref) {
  return ref.watch(articlesRepositoryProvider).getSources();
}

@riverpod
Future<List<Article>> getTopArticlesBySourceId(
  GetTopArticlesBySourceIdRef ref,
  String sourceId,
) {
  return ref
      .watch(articlesRepositoryProvider)
      .getTopArticlesBySourceId(sourceId);
}

abstract class ArticlesRepository {
  Future<List<Source>> getSources();
  Future<List<Article>> getTopArticlesBySourceId(String sourceId);
}
