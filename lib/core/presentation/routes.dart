enum SimpleNewsRoutes {
  sources('/sources'),
  favorites('/favorites'),

  /// This path SHOULD NOT be used.
  /// This path is only to represent the route path, but can't be used
  /// for navigation proposes since it depends on a path param.
  articles('/sources/:sourceId/articles'),
  favoriteArticles('favorites/:articleId');

  final String path;
  const SimpleNewsRoutes(this.path);
}
