import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/articles/domain/entities/article.dart';
import '../../features/articles/presentation/article_screen.dart';
import '../../features/articles/presentation/articles_screen.dart';
import '../../features/articles/presentation/favorites_screen.dart';
import '../../features/articles/presentation/sources_screen.dart';
import 'home_screen.dart';
import 'routes.dart';
import 'theme.dart';

part 'router.dart';

class SimpleNews extends StatelessWidget {
  const SimpleNews({super.key});

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
