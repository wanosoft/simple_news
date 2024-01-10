import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/article.dart';
import 'saved_articles_state.dart';

class ArticleScreen extends ConsumerStatefulWidget {
  ArticleScreen(
    this.article, {
    super.key,
  }) : assert(article.content != null, 'Content should not be null!');

  final Article article;

  String get author => article.author ?? 'Unknown Author';

  @override
  ConsumerState<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends ConsumerState<ArticleScreen> {
  late bool _isSaved;

  @override
  Widget build(context) {
    final savedArticlesState = ref.watch(savedArticlesProvider);
    final savedArticlesNotifier = ref.read(savedArticlesProvider.notifier);

    _isSaved = savedArticlesState.maybeWhen(
      data: (articles) => articles.contains(widget.article),
      orElse: () => false,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title ?? 'Unnamed article'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.article.content!),
              const SizedBox(height: 15),
              Text(
                'By ${widget.author}',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_isSaved) {
            savedArticlesNotifier.removeArticle(widget.article);
            setState(() => _isSaved = false);
          } else {
            savedArticlesNotifier.addArticle(widget.article);
            setState(() => _isSaved = true);
          }
        },
        child: Icon(_isSaved ? Icons.favorite : Icons.favorite_border),
      ),
    );
  }
}
