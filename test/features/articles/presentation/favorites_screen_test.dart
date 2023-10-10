import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_news/core/presentation/routes.dart';
import 'package:simple_news/features/articles/domain/articles_repository.dart';
import 'package:simple_news/features/articles/presentation/favorites_screen.dart';
import 'package:simple_news/features/articles/presentation/widgets/simple_news_list_item.dart';

import '../../../core/presentation/test_widgets_utils.dart';
import '../domain/entity_factory.dart';

void main() {
  late GoRouter goRouter;

  setUp(() => goRouter = MockGoRouter());

  testWidgets('favorites screen', (tester) async {
    final expectedArticle = createArticle();
    when(
      () => goRouter.pushNamed(
        SimpleNewsRoutes.article.name,
        extra: expectedArticle,
      ),
    ).thenAnswer((_) async => true);

    await prepareAndSettle(
      tester,
      widget: const FavoritesScreen(),
      isConsumer: true,
      overrides: [
        getAllSavedArticlesProvider.overrideWith(
          (provider) async => [expectedArticle, createArticle(content: null)],
        ),
      ],
      goRouter: goRouter,
    );

    expect(find.byType(FavoritesScreen), findsOneWidget);

    final articleItemFinder = find.byType(SimpleNewsListItem);
    expect(articleItemFinder, findsOneWidget);

    await tester.tap(articleItemFinder);
    await tester.pumpAndSettle();

    verify(
      () => goRouter.pushNamed(
        SimpleNewsRoutes.article.name,
        extra: expectedArticle,
      ),
    ).called(1);
    verifyNoMoreInteractions(goRouter);
  });
}
