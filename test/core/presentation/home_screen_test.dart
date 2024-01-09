import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_news/core/presentation/home_screen.dart';
import 'package:simple_news/core/presentation/routes.dart';

import 'test_widgets_utils.dart';

void main() {
  late GoRouter goRouter;

  setUp(() {
    goRouter = MockGoRouter();
  });

  testWidgets('home screen', (tester) async {
    await prepareAndSettle(
      tester,
      widget: const HomeScreen(child: Placeholder()),
      isConsumer: true,
      goRouter: goRouter,
    );

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.byType(BottomNavigationBar), findsOneWidget);
    expect(find.byType(Placeholder), findsOneWidget);

    final sourcesButton = find.byIcon(Icons.newspaper);

    expect(sourcesButton, findsOneWidget);

    await tester.tap(sourcesButton);
    await tester.pumpAndSettle();

    verify(() => goRouter.go(SimpleNewsRoutes.sources.path)).called(1);

    final favoritesButton = find.byIcon(Icons.favorite);

    expect(favoritesButton, findsOneWidget);

    await tester.tap(favoritesButton);
    await tester.pumpAndSettle();

    verify(() => goRouter.go(SimpleNewsRoutes.favorites.path)).called(1);
  });
}
