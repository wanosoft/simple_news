import '../../../core/domain/entities/failure.dart';
import '../domain/articles_repository.dart';
import '../domain/entities/article.dart';
import '../domain/entities/source.dart';
import 'remote/articles_service.dart';

class ArticlesRepositoryImpl extends ArticlesRepository {
  ArticlesRepositoryImpl(this._articlesService);

  final ArticlesService _articlesService;

  @override
  Future<List<Source>> getSources() async {
    try {
      final response = await _articlesService.getSources();
      return response.sources.map((model) => model.toSource()).toList();
    } catch (error) {
      throw Failure.fromException(error);
    }
  }

  @override
  Future<List<Article>> getTopArticlesBySourceId(String sourceId) async {
    try {
      final response = await _articlesService.getTopArticlesBySourceId(
        sourceId,
      );
      return response.articles.map((model) => model.toArticle()).toList();
    } catch (error) {
      throw Failure.fromException(error);
    }
  }
}
