import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentation/riverpod_extensions.dart';
import '../../../core/presentation/routes.dart';
import '../domain/articles_repository.dart';
import '../domain/entities/source.dart';
import 'widgets/simple_news_list_item.dart';

class SourcesScreen extends ConsumerWidget {
  const SourcesScreen({super.key});

  @override
  Widget build(context, ref) {
    final sourcesState = ref.watch(getSourcesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Simple News')),
      body: sourcesState.renderWhen(
        (sources) {
          List<Source> verifiedSources = [];

          for (final source in sources) {
            if (source.id != null) {
              verifiedSources.add(source);
            }
          }

          return RefreshIndicator(
            onRefresh: () => ref.refresh(getSourcesProvider.future),
            child: SingleChildScrollView(
              child: Column(
                children: verifiedSources
                    .map(
                      (source) => SimpleNewsListItem.source(
                        source,
                        onTap: () => context.goNamed(
                          SimpleNewsRoutes.articles.name,
                          pathParameters: {'sourceId': source.id!},
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        },
        onRetry: () => ref.refresh(getSourcesProvider),
      ),
    );
  }
}
