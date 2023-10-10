import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentation/riverpod_extensions.dart';
import '../../../core/presentation/routes.dart';
import '../domain/articles_repository.dart';
import '../domain/entities/article.dart';
import 'widgets/simple_news_list_item.dart';

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
        (articles) {
          List<Article> verifiedArticles = [];

          for (final article in articles) {
            if (article.content != null) {
              verifiedArticles.add(article);
            }
          }

          return RefreshIndicator(
            onRefresh: () => ref.refresh(
              getTopArticlesBySourceIdProvider(sourceId).future,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: verifiedArticles
                    .map(
                      (article) => SimpleNewsListItem.article(
                        article,
                        onTap: () => context.pushNamed(
                          SimpleNewsRoutes.article.name,
                          extra: article,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        },
        onRetry: () => ref.refresh(getTopArticlesBySourceIdProvider(sourceId)),
      ),
    );
  }
}
