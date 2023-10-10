import '../../../core/domain/entities/failure.dart';
import '../domain/articles_repository.dart';
import '../domain/entities/article.dart';
import '../domain/entities/source.dart';
import 'data_sources/articles_local_service.dart';
import 'data_sources/articles_remote_service.dart';
import 'models/article_model.dart';

class ArticlesRepositoryImpl extends ArticlesRepository {
  ArticlesRepositoryImpl(this._remoteService, this._localService);

  final ArticlesRemoteService _remoteService;
  final ArticlesLocalService _localService;

  @override
  Future<List<Source>> getSources() async {
    try {
      final response = await _remoteService.getSources();
      return response.sources.map((model) => model.toSource()).toList();
    } catch (error) {
      throw Failure.fromException(error);
    }
  }

  @override
  Future<List<Article>> getTopArticlesBySourceId(String sourceId) async {
    try {
      final response = await _remoteService.getTopArticlesBySourceId(
        sourceId,
      );
      return response.articles.toArticleList();
    } catch (error) {
      throw Failure.fromException(error);
    }
  }

  @override
  Future<bool> articleIsAlreadySaved(Article article) async {
    try {
      return await _localService.articleIsAlreadySaved(
        ArticleModel.fromEntity(article),
      );
    } catch (error) {
      throw Failure.fromException(error);
    }
  }

  @override
  Future<void> deleteArticle(Article article) async {
    try {
      await _localService.deleteArticle(
        ArticleModel.fromEntity(article),
      );
    } catch (error) {
      throw Failure.fromException(error);
    }
  }

  @override
  Future<List<Article>> getAllSavedArticles() async {
    try {
      final models = await _localService.getAllSavedArticles();
      return models.toArticleList();
    } catch (error) {
      throw Failure.fromException(error);
    }
  }

  @override
  Future<void> saveArticle(Article article) async {
    try {
      await _localService.saveArticle(ArticleModel.fromEntity(article));
    } catch (error) {
      throw Failure.fromException(error);
    }
  }
}
