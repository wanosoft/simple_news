import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/articles_repository.dart';
import '../../domain/entities/article.dart';

part 'saved_articles_state.g.dart';

@riverpod
class SavedArticlesState extends _$SavedArticlesState {
  @override
  Future<List<Article>> build() async {
    return await ref.watch(getAllSavedArticlesProvider.future);
  }

  Future<void> addArticle(Article article) async {
    state = await AsyncValue.guard(() async {
      await ref.watch(saveArticleProvider(article).future);
      return [...state.asData!.value, article];
    });
  }

  Future<void> removeArticle(Article article) async {
    state = await AsyncValue.guard(() async {
      await ref.watch(deleteArticleProvider(article).future);
      final previousState = state.asData!.value;
      previousState.remove(article);
      return previousState;
    });
  }
}
