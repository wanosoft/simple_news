import 'dart:developer';

import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/articles/domain/articles_repository.dart';
import '../../features/articles/domain/entities/article.dart';
import '../../features/articles/presentation/article_screen.dart';
import '../../features/articles/presentation/articles_screen.dart';
import '../../features/articles/presentation/favorites_screen.dart';
import '../../features/articles/presentation/sources_screen.dart';
import 'home_screen.dart';
import 'routes.dart';
import 'theme.dart';

part 'router.dart';

class SimpleNews extends ConsumerStatefulWidget {
  const SimpleNews({super.key});

  @override
  ConsumerState<SimpleNews> createState() => _SimpleNewsState();
}

class _SimpleNewsState extends ConsumerState<SimpleNews> {
  final _backgroundFetchConfig = BackgroundFetchConfig(
    minimumFetchInterval: 15,
    stopOnTerminate: true,
    enableHeadless: false,
    requiresBatteryNotLow: false,
    requiresCharging: false,
    requiresStorageNotLow: false,
    requiresDeviceIdle: false,
    requiredNetworkType: NetworkType.NONE,
  );

  void _backgroundFetchTimeoutFunction(String taskId) {
    log('[BackgroundFetch] TASK TIMEOUT taskId: $taskId');
    BackgroundFetch.finish(taskId);
  }

  void _onBackgroundFetch(String taskId) async {
    log('[BackgroundFetch] Event received $taskId');
    // Fetch sources on background
    final response = await ref.watch(getSourcesProvider.future);
    log('[BackgroundFetch] response: $response');
    BackgroundFetch.finish(taskId);
  }

  Future<void> initBackgroundFetchCallback() async {
    final status = await BackgroundFetch.configure(
      _backgroundFetchConfig,
      _onBackgroundFetch,
      _backgroundFetchTimeoutFunction,
    );

    log('[BackgroundFetch] configure success: $status');

    if (!mounted) return;
  }

  @override
  void initState() {
    super.initState();
    initBackgroundFetchCallback();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Simple News',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: SimpleNewsTheme.textTheme,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        textTheme: SimpleNewsTheme.textTheme,
      ),
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}
