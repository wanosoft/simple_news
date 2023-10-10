import 'package:flutter_test/flutter_test.dart';
import 'package:simple_news/core/presentation/simple_news.dart';
import 'package:simple_news/features/articles/presentation/sources_screen.dart';

import 'test_widgets_utils.dart';

void main() {
  testWidgets('SimpleNews widget test', (tester) async {
    await prepareAndSettle(
      tester,
      widget: const SimpleNews(),
      isConsumer: true,
    );

    expect(find.byType(SourcesScreen), findsOneWidget);
  });
}
