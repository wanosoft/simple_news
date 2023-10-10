enum SimpleNewsRoutes {
  sources('/sources'),
  favorites('/favorites'),
  article('/article'),

  /// These paths SHOULD NOT be used for navigation purposes,
  /// as they depend on a path parameter.
  articles('/sources/:sourceId'),
  favoriteArticles('favorites/:articleId');

  final String path;
  const SimpleNewsRoutes(this.path);
}
