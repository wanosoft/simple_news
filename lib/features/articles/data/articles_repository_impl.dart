import '../domain/articles_repository.dart';
import '../domain/entities/article.dart';
import '../domain/entities/source.dart';
import 'remote/articles_service.dart';

// TODO: Add error handling
class ArticlesRepositoryImpl extends ArticlesRepository {
  ArticlesRepositoryImpl(this._articlesService);

  final ArticlesService _articlesService;

  @override
  Future<List<Source>> getSources() async {
    final response = await _articlesService.getSources();
    return response.sources.map((model) => model.toSource()).toList();
  }

  @override
  Future<List<Article>> getTopArticlesBySourceId(String sourceId) async {
    final response = await _articlesService.getTopArticlesBySourceId(sourceId);
    return response.articles.map((model) => model.toArticle()).toList();
  }
}
