import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/presentation/riverpod_extensions.dart';
import '../domain/articles_repository.dart';
import '../domain/entities/article.dart';
import 'widgets/article_list_view.dart';

part 'favorites_screen.g.dart';

@riverpod
class SavedArticles extends _$SavedArticles {
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
      return [...previousState];
    });
  }
}

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(context, ref) {
    final articlesState = ref.watch(savedArticlesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Articles'),
      ),
      body: articlesState.renderWhen(
        (articles) => ArticleListView(
          articles: articles,
          onRefresh: () => ref.refresh(savedArticlesProvider.future),
        ),
        onRetry: () => ref.refresh(savedArticlesProvider.future),
      ),
    );
  }
}
