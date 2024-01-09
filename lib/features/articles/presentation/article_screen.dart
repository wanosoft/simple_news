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
  late bool _isSaved = false;
  late AsyncValue<bool> isSavedState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref.watch(savedArticlesProvider).maybeWhen(
          data: (saved) => setState(
            () => _isSaved = saved.contains(widget.article),
          ),
          orElse: () => setState(() => _isSaved = false),
        );
  }

  @override
  Widget build(context) {
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
            ref
                .read(savedArticlesProvider.notifier)
                .removeArticle(widget.article);
            setState(() => _isSaved = false);
          } else {
            ref.read(savedArticlesProvider.notifier).addArticle(widget.article);
            setState(() => _isSaved = true);
          }
        },
        child: Icon(_isSaved ? Icons.favorite : Icons.favorite_border),
      ),
    );
  }
}
