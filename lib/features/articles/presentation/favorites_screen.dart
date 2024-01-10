import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/presentation/riverpod_extensions.dart';
import 'saved_articles_state.dart';
import 'widgets/article_list_view.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(context, ref) {
    final articlesState = ref.watch(savedArticlesStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Articles'),
      ),
      body: articlesState.renderWhen(
        (articles) => ArticleListView(
          articles: articles,
          onRefresh: () => ref.refresh(savedArticlesStateProvider.future),
        ),
        onRetry: () => ref.refresh(savedArticlesStateProvider.future),
      ),
    );
  }
}
