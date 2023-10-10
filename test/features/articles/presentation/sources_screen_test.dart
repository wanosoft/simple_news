import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_news/core/presentation/routes.dart';
import 'package:simple_news/features/articles/domain/articles_repository.dart';
import 'package:simple_news/features/articles/presentation/sources_screen.dart';
import 'package:simple_news/features/articles/presentation/widgets/simple_news_list_item.dart';

import '../../../core/mock_data.dart';
import '../../../core/presentation/test_widgets_utils.dart';
import '../domain/entity_factory.dart';

void main() {
  late GoRouter goRouter;

  setUp(() => goRouter = MockGoRouter());

  testWidgets('sources screen', (tester) async {
    await prepareAndSettle(
      tester,
      widget: const SourcesScreen(),
      isConsumer: true,
      overrides: [
        getSourcesProvider.overrideWith(
          (ref) => [createSource(), createSource(id: null)],
        )
      ],
      goRouter: goRouter,
    );

    expect(find.byType(SourcesScreen), findsOneWidget);

    final sourceItemFinder = find.byType(SimpleNewsListItem);
    expect(sourceItemFinder, findsOneWidget);

    await tester.tap(sourceItemFinder);
    await tester.pumpAndSettle();

    verify(
      () => goRouter.goNamed(
        SimpleNewsRoutes.articles.name,
        pathParameters: {'sourceId': sourceId},
      ),
    ).called(1);
    verifyNoMoreInteractions(goRouter);
  });
}
