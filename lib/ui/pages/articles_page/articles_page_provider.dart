import 'dart:math';

import 'package:flutter_qiita_app/dio.dart';
import 'package:flutter_qiita_app/models/article/article.dart';
import 'package:flutter_qiita_app/repositories/article_repository/article_repository.dart';
import 'package:flutter_qiita_app/ui/pages/articles_page/articles_page_state/articles_page_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef State = ArticlesPageState;

final articlesPageProvider = StateNotifierProvider<ArticlesPageNotifier, State>(
  (ref) {
    return ArticlesPageNotifier();
  },
);

class ArticlesPageNotifier extends StateNotifier<State> {
  ArticlesPageNotifier() : super(const State()) {
    fetchFirstPageArticles();
  }

  final _articleRepository = ArticleRepository(dio);

  Future<List<Article>> _fetchArticles({required int page}) async {
    final response = await _articleRepository.fetchArticles(page: page);
    final headers = response.response.headers;
    final totalCount = int.parse(headers.value('Total-Count') ?? '0');
    final maxPage = min(100, (totalCount / 20).ceil());
    state = state.copyWith(page: page + 1, maxPage: maxPage);
    return response.data;
  }

  Future<void> fetchFirstPageArticles() async {
    final articles = await _fetchArticles(page: 1);
    state = state.copyWith(articles: articles);
  }

  Future<void> fetchNextPageArticles() async {
    if (state.isNextPageArticlesFetching || state.maxPage! < state.page) return;
    state = state.copyWith(isNextPageArticlesFetching: true);
    final articles = await _fetchArticles(page: state.page);
    state = state.copyWith(
      isNextPageArticlesFetching: false,
      articles: state.articles! + articles,
    );
  }
}
