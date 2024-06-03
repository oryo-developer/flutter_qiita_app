import 'package:flutter_qiita_app/dio.dart';
import 'package:flutter_qiita_app/pages/articles_page/articles_page_state/articles_page_state.dart';
import 'package:flutter_qiita_app/repositories/article_repository/article_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef ArticlesPageProvider
    = StateNotifierProvider<ArticlesPageNotifier, ArticlesPageState>;

final articlesPageProvider = ArticlesPageProvider((ref) {
  return ArticlesPageNotifier();
});

class ArticlesPageNotifier extends StateNotifier<ArticlesPageState> {
  ArticlesPageNotifier() : super(const ArticlesPageState()) {
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    final articleRepository = ArticleRepository(dio);
    final articles = await articleRepository.fetchArticles(page: state.page);
    state = state.copyWith(articles: articles);
  }
}
