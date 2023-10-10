part of 'simple_news.dart';

final _router = GoRouter(
  initialLocation: SimpleNewsRoutes.sources.path,
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomeScreen(child: child),
      routes: [
        GoRoute(
          name: SimpleNewsRoutes.sources.name,
          path: SimpleNewsRoutes.sources.path,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SourcesScreen(),
          ),
          routes: [
            GoRoute(
              name: SimpleNewsRoutes.articles.name,
              path: ':sourceId',
              builder: (context, state) {
                final sourceId = state.pathParameters['sourceId']!;
                return ArticlesScreen(sourceId);
              },
            ),
          ],
        ),
        GoRoute(
          name: SimpleNewsRoutes.favorites.name,
          path: SimpleNewsRoutes.favorites.path,
          pageBuilder: (_, __) => const NoTransitionPage(
            child: FavoritesScreen(),
          ),
        ),
        GoRoute(
          name: SimpleNewsRoutes.article.name,
          path: SimpleNewsRoutes.article.path,
          builder: (context, state) {
            final article = state.extra as Article;
            return ArticleScreen(article);
          },
        ),
      ],
    ),
  ],
);
