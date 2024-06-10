import 'package:flutter_qiita_app/models/article/article.dart';
import 'package:flutter_qiita_app/services/article_service.dart';
import 'package:flutter_qiita_app/states/pages/articles_page_state/articles_page_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final articlesPageProvider =
    StateNotifierProvider<ArticlesPageNotifier, ArticlesPageState>((ref) {
  throw UnimplementedError();
});

class ArticlesPageNotifier extends StateNotifier<ArticlesPageState> {
  ArticlesPageNotifier({
    String? query,
  }) : super(ArticlesPageState(query: query)) {
    fetchFirstPageArticles();
  }

  final _articleService = ArticleService();

  Future<void> fetchFirstPageArticles() async {
    final articles = await _fetchArticles(page: 1);
    state = state.copyWith(articles: articles);
  }

  Future<void> fetchNextPageArticles() async {
    if (state.isFetchingNextPageArticles || state.maxPage! < state.page) return;
    state = state.copyWith(isFetchingNextPageArticles: true);
    final articles = await _fetchArticles(page: state.page);
    state = state.copyWith(
      isFetchingNextPageArticles: false,
      articles: state.articles! + articles,
    );
  }

  Future<List<Article>> _fetchArticles({required int page}) async {
    final (
      maxPage,
      articles,
    ) = await _articleService.fetchArticles(page: page, query: state.query);
    state = state.copyWith(page: page + 1, maxPage: maxPage);
    return articles;
  }
}
