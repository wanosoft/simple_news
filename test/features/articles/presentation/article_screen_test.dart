import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_news/features/articles/domain/entities/article.dart';
import 'package:simple_news/features/articles/presentation/article_screen.dart';
import 'package:simple_news/features/articles/presentation/saved_articles_state.dart';

import '../../../core/presentation/test_widgets_utils.dart';
import '../domain/entity_factory.dart';

class MockSavedArticles extends Mock implements SavedArticles {}

void main() {
  late final Article article;
  late final SavedArticles savedArticles;

  setUp(() {
    article = createArticle();
    savedArticles = MockSavedArticles();
  });

  testWidgets('article screen', (tester) async {
    when(() => savedArticles.build()).thenAnswer(
      (invocation) async => [createArticle(title: 'other')],
    );
    when(() => savedArticles.addArticle(article)).thenAnswer(
      (invocation) async {},
    );
    when(() => savedArticles.removeArticle(article)).thenAnswer(
      (invocation) async {},
    );

    await prepareAndSettle(
      tester,
      widget: ArticleScreen(article),
      isConsumer: true,
      overrides: [
        savedArticlesProvider.overrideWith(() => SavedArticles()),
      ],
    );

    await tester.pumpAndSettle(const Duration(seconds: 50));

    expect(find.byType(ArticleScreen), findsOneWidget);

    final fabFinder = find.byType(FloatingActionButton);
    expect(fabFinder, findsOneWidget);
    await tester.ensureVisible(fabFinder);

    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.favorite_border), findsOneWidget);

    await tester.tap(fabFinder);
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsNothing);
  });
}
