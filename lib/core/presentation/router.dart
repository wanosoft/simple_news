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
        ),
        GoRoute(
          name: SimpleNewsRoutes.favorites.name,
          path: SimpleNewsRoutes.favorites.path,
          pageBuilder: (_, __) => const NoTransitionPage(
            child: FavoritesScreen(),
          ),
        ),
      ],
    ),
  ],
);
