import 'package:flutter_test/flutter_test.dart';
import 'package:simple_news/features/articles/presentation/widgets/article_list_view.dart';
import 'package:simple_news/features/articles/presentation/widgets/simple_news_list_item.dart';

import '../../../../core/presentation/test_widgets_utils.dart';
import '../../domain/entity_factory.dart';

void main() {
  group('article list view', () {
    testWidgets('should return a list of articls', (tester) async {
      await prepareAndSettle(
        tester,
        widget: ArticleListView(
          articles: [
            createArticle(content: 'content'),
            createArticle(content: 'content2'),
          ],
          onRefresh: () async => {},
        ),
      );

      expect(
        find.byType(SimpleNewsListItem, skipOffstage: false),
        findsNWidgets(2),
      );
    });

    testWidgets('should return empty state if list is emtpy', (tester) async {
      await prepareAndSettle(
        tester,
        widget: ArticleListView(
          articles: const [],
          onRefresh: () async => {},
        ),
      );

      expect(find.byType(EmptyListState), findsOneWidget);
    });
  });
}
