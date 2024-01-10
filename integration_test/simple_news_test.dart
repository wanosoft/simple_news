import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_news/core/presentation/home_screen.dart';
import 'package:simple_news/core/presentation/simple_news.dart';
import 'package:simple_news/features/articles/data/data_sources/articles_remote_service.dart';
import 'package:simple_news/features/articles/data/data_sources/fake_articles_remote_service.dart';
import 'package:simple_news/features/articles/presentation/article_screen.dart';
import 'package:simple_news/features/articles/presentation/articles_screen.dart';
import 'package:simple_news/features/articles/presentation/favorites_screen.dart';
import 'package:simple_news/features/articles/presentation/sources_screen.dart';
import 'package:simple_news/features/articles/presentation/widgets/article_list_view.dart';
import 'package:simple_news/features/articles/presentation/widgets/simple_news_list_item.dart';

import '../test/features/articles/data/model_factory.dart';

void main() {
  testWidgets('SimpleNews should save/unsave favorite news', (tester) async {
    final articles = createArticlesResponseWrapper();
    final sources = createSourcesResponseWrapper();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          articlesRemoteServiceProvider.overrideWith(
            (_) => FakeArticlesRemoteService(
              delayDuration: const Duration(milliseconds: 500),
              articlesResponseWrapperResolver: () => articles,
              sourcesResponseWrapperResolver: () => sources,
            ),
          ),
        ],
        child: const SimpleNews(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(SimpleNews), findsOneWidget);
    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.byType(SourcesScreen), findsOneWidget);

    final sourceFinder = find.byType(SimpleNewsListItem);
    expect(sourceFinder, findsOneWidget);

    // Navigate to ArticlesScreen
    await tester.tap(sourceFinder);
    await tester.pumpAndSettle();

    expect(find.byType(ArticlesScreen), findsOneWidget);

    final articleFinder = find.byType(SimpleNewsListItem);
    expect(articleFinder, findsOneWidget);

    // Navigate to ArticleScreen
    await tester.tap(articleFinder);
    await tester.pumpAndSettle();

    expect(find.byType(ArticleScreen), findsOneWidget);

    final fabButtonFinder = find.byType(FloatingActionButton);
    expect(fabButtonFinder, findsOneWidget);

    // Save article
    await tester.tap(fabButtonFinder);
    await tester.pumpAndSettle();

    // Navigate to HomeScreen
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);

    // Navigate to FavoritesScreen
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle();

    expect(find.byType(FavoritesScreen), findsOneWidget);

    final favoriteArticleFinder = find.byType(SimpleNewsListItem);
    expect(favoriteArticleFinder, findsOneWidget);

    // Navigate to ArticleScreen
    await tester.tap(favoriteArticleFinder);
    await tester.pumpAndSettle();

    expect(find.byType(ArticleScreen), findsOneWidget);

    // Verify that the article is saved
    expect(find.byIcon(Icons.favorite), findsNWidgets(2));

    // Navigate to HomeScreen
    await tester.tap(find.byIcon(Icons.newspaper));
    await tester.pumpAndSettle();

    // Navigate to ArticlesScreen
    await tester.tap(sourceFinder);
    await tester.pumpAndSettle();

    // Navigate to ArticleScreen
    await tester.tap(articleFinder);
    await tester.pumpAndSettle();

    // Verify that the fetched article is saved
    expect(find.byIcon(Icons.favorite), findsNWidgets(2));

    // Unsave article
    await tester.tap(fabButtonFinder);
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);

    // Navigate to HomeScreen
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);

    // Navigate to FavoritesScreen
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle();

    // Verify that the fetched article is unsaved
    expect(find.byType(FavoritesScreen), findsOneWidget);
    expect(find.byType(SimpleNewsListItem), findsNothing);
    expect(find.byType(EmptyListState), findsOneWidget);
  });
}
