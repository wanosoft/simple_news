import '../../../core/domain/entities/failure.dart';
import '../domain/articles_repository.dart';
import '../domain/entities/article.dart';
import '../domain/entities/source.dart';
import 'data_sources/articles_remote_service.dart';

class ArticlesRepositoryImpl extends ArticlesRepository {
  ArticlesRepositoryImpl(this._articlesRemoteService);

  final ArticlesRemoteService _articlesRemoteService;

  @override
  Future<List<Source>> getSources() async {
    try {
      final response = await _articlesRemoteService.getSources();
      return response.sources.map((model) => model.toSource()).toList();
    } catch (error) {
      throw Failure.fromException(error);
    }
  }

  @override
  Future<List<Article>> getTopArticlesBySourceId(String sourceId) async {
    try {
      final response = await _articlesRemoteService.getTopArticlesBySourceId(
        sourceId,
      );
      return response.articles.map((model) => model.toArticle()).toList();
    } catch (error) {
      throw Failure.fromException(error);
    }
  }
}
