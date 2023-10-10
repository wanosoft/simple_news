import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_news/features/articles/presentation/widgets/simple_news_list_item.dart';

import '../../../../core/mock_data.dart';
import '../../../../core/presentation/test_widgets_utils.dart';
import '../../../../mocks.dart';
import '../../domain/entity_factory.dart';

void main() {
  group('simple news list item', () {
    late VoidCallBack onTap;
    const description = 'This is a example description';

    setUp(() => onTap = MockVoidCallBack());

    testWidgets('source factory constructor', (tester) async {
      final source = createSource(description: description);

      await prepareAndSettle(
        tester,
        widget: SimpleNewsListItem.source(
          source,
          onTap: onTap,
        ),
      );

      final itemFinder = find.byType(SimpleNewsListItem);
      expect(itemFinder, findsOneWidget);

      expect(find.text(source.name), findsOneWidget);
      expect(find.text(description), findsOneWidget);

      await tester.tap(itemFinder);
      await tester.pumpAndSettle();

      verify(() => onTap()).called(1);
      verifyNoMoreInteractions(onTap);
    });

    testWidgets('article factory constructor', (tester) async {
      final article = createArticle(description: description);

      await prepareAndSettle(
        tester,
        widget: SimpleNewsListItem.article(
          article,
          onTap: onTap,
        ),
      );

      final itemFinder = find.byType(SimpleNewsListItem);
      expect(itemFinder, findsOneWidget);

      expect(find.text(articleTitle), findsOneWidget);
      expect(find.text(description), findsOneWidget);

      await tester.tap(itemFinder);
      await tester.pumpAndSettle();

      verify(() => onTap()).called(1);
      verifyNoMoreInteractions(onTap);
    });
  });
}
