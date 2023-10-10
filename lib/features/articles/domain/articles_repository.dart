import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/articles_repository_impl.dart';
import '../data/data_sources/articles_local_service.dart';
import '../data/data_sources/articles_remote_service.dart';
import 'entities/article.dart';
import 'entities/source.dart';

part 'articles_repository.g.dart';

@Riverpod(keepAlive: true)
ArticlesRepository articlesRepository(ArticlesRepositoryRef ref) {
  final remoteService = ref.watch(articlesRemoteServiceProvider);
  final localService = ref.watch(articlesLocalServiceProvider);
  return ArticlesRepositoryImpl(remoteService, localService);
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

@riverpod
Future<List<Article>> getAllSavedArticles(
  GetAllSavedArticlesRef ref,
) {
  return ref.watch(articlesRepositoryProvider).getAllSavedArticles();
}

@riverpod
Future<bool> articleIsAlreadySaved(
  ArticleIsAlreadySavedRef ref,
  Article article,
) =>
    ref.watch(articlesRepositoryProvider).articleIsAlreadySaved(article);

@riverpod
Future<void> saveArticle(
  SaveArticleRef ref,
  Article article,
) =>
    ref.watch(articlesRepositoryProvider).saveArticle(article);

@riverpod
Future<void> deleteArticle(
  DeleteArticleRef ref,
  Article article,
) =>
    ref.watch(articlesRepositoryProvider).deleteArticle(article);

abstract class ArticlesRepository {
  Future<List<Source>> getSources();
  Future<List<Article>> getTopArticlesBySourceId(String sourceId);
  Future<List<Article>> getAllSavedArticles();
  Future<bool> articleIsAlreadySaved(Article article);
  Future<void> saveArticle(Article article);
  Future<void> deleteArticle(Article article);
}
