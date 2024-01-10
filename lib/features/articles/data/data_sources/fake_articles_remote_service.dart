import '../models/response_wrapper.dart';
import 'articles_remote_service.dart';

class FakeArticlesRemoteService implements ArticlesRemoteService {
  FakeArticlesRemoteService({
    this.delayDuration = const Duration(milliseconds: 900),
    required this.sourcesResponseWrapperResolver,
    required this.articlesResponseWrapperResolver,
  });

  final Duration delayDuration;
  final SourcesResponseWrapper Function() sourcesResponseWrapperResolver;
  final ArticlesResponseWrapper Function() articlesResponseWrapperResolver;

  Future<void> _simulateNetworkCall(Duration duration) async {
    await Future.delayed(duration);
  }

  @override
  Future<SourcesResponseWrapper> getSources() async {
    await _simulateNetworkCall(delayDuration);
    return sourcesResponseWrapperResolver();
  }

  @override
  Future<ArticlesResponseWrapper> getTopArticlesBySourceId(
    String sourceId,
  ) async {
    await _simulateNetworkCall(delayDuration);
    return articlesResponseWrapperResolver();
  }
}
