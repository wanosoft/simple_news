import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_news/features/articles/domain/articles_repository.dart';
import 'package:simple_news/features/articles/domain/entities/article.dart';
import 'package:simple_news/features/articles/presentation/article_screen.dart';

import '../../../core/presentation/test_widgets_utils.dart';
import '../../../mocks.dart';
import '../domain/entity_factory.dart';

void main() {
  late final Article article;
  late final VoidCallBack voidCallBack;

  setUp(() {
    article = createArticle();
    voidCallBack = MockVoidCallBack();
  });

  testWidgets('article screen', (tester) async {
    await prepareAndSettle(
      tester,
      widget: ArticleScreen(article),
      isConsumer: true,
      overrides: [
        getAllSavedArticlesProvider.overrideWith((_) async => [article]),
        saveArticleProvider.overrideWith((_) async => voidCallBack.call),
        deleteArticleProvider.overrideWith((_) async => voidCallBack.call),
      ],
    );

    await tester.pumpAndSettle(const Duration(seconds: 50));

    expect(find.byType(ArticleScreen), findsOneWidget);

    final fabFinder = find.byType(FloatingActionButton);
    expect(fabFinder, findsOneWidget);
    await tester.ensureVisible(fabFinder);

    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.favorite_border), findsNothing);
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    await tester.tap(fabFinder);
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.favorite), findsNothing);
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
  });
}
