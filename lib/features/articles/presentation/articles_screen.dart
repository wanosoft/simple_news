import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/presentation/riverpod_extensions.dart';
import '../domain/articles_repository.dart';
import 'widgets/article_list_view.dart';

class ArticlesScreen extends ConsumerWidget {
  const ArticlesScreen(
    this.sourceId, {
    super.key,
  });

  final String sourceId;

  @override
  Widget build(context, ref) {
    final articlesState = ref.watch(
      getTopArticlesBySourceIdProvider(sourceId),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(sourceId),
      ),
      body: articlesState.renderWhen(
        (articles) => ArticleListView(
          articles: articles,
          onRefresh: () => ref.refresh(
            getTopArticlesBySourceIdProvider(sourceId).future,
          ),
        ),
        onRetry: () => ref.refresh(
          getTopArticlesBySourceIdProvider(sourceId).future,
        ),
      ),
    );
  }
}
