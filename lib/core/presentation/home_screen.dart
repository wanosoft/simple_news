import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/articles/domain/articles_repository.dart';
import 'routes.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Initialize providers and keep state
    ref.watch(getSourcesProvider);

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Sources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }

  void _onTap(int value) {
    if (value == 0) {
      context.go(SimpleNewsRoutes.sources.path);
    } else {
      context.go(SimpleNewsRoutes.favorites.path);
    }

    setState(() => _currentIndex = value);
  }
}
