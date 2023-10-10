import 'package:flutter/material.dart';

import '../../domain/entities/article.dart';
import '../../domain/entities/source.dart';

class SimpleNewsListItem extends StatelessWidget {
  const SimpleNewsListItem._({
    required this.title,
    required this.description,
    required this.onTap,
    super.key,
  });

  final String title, description;
  final VoidCallback onTap;

  factory SimpleNewsListItem.source(
    Source source, {
    required VoidCallback onTap,
    Key? key,
  }) {
    return SimpleNewsListItem._(
      title: source.name,
      description: source.description ?? 'A simple news source, give it a try.',
      onTap: onTap,
      key: key,
    );
  }

  factory SimpleNewsListItem.article(
    Article article, {
    required VoidCallback onTap,
    Key? key,
  }) =>
      SimpleNewsListItem._(
        title: article.title ?? 'No Title',
        description: article.description ?? 'No Description',
        onTap: onTap,
        key: key,
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8.0),
            Text(description),
          ],
        ),
      ),
    );
  }
}
