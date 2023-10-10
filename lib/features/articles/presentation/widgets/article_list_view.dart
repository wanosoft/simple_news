import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/routes.dart';
import '../../domain/entities/article.dart';
import 'simple_news_list_item.dart';

class ArticleListView extends StatelessWidget {
  const ArticleListView({
    super.key,
    required this.articles,
    required this.onRefresh,
  });

  final List<Article> articles;
  final Future<void> Function() onRefresh;

  bool get isEmtpy => articles.isEmpty;

  @override
  Widget build(BuildContext context) {
    List<Article> verifiedArticles = [];

    for (final article in articles) {
      if (article.content != null) {
        verifiedArticles.add(article);
      }
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: isEmtpy
            ? const EmptyListState()
            : Column(
                children: verifiedArticles
                    .map(
                      (article) => SimpleNewsListItem.article(
                        key: Key(article.hashCode.toString()),
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
  }
}

@visibleForTesting
class EmptyListState extends StatelessWidget {
  const EmptyListState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Icon(
            Icons.newspaper,
            color: Colors.grey,
          ),
          Text(
            "There's no articles yet",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
