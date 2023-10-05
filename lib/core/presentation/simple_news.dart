import 'package:flutter/material.dart';

import '../../features/home/presentation/home_screen.dart';
import 'simple_news_theme.dart';

class SimpleNews extends StatelessWidget {
  const SimpleNews({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple News',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        textTheme: SimpleNewsTheme.textTheme,
      ),
      home: const HomeScreen(),
    );
  }
}
