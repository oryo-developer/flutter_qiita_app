import 'package:flutter_qiita_app/dio.dart';
import 'package:flutter_qiita_app/extensions/http_response_extension.dart';
import 'package:flutter_qiita_app/models/article/article.dart';
import 'package:flutter_qiita_app/repositories/article_repository/article_repository.dart';

class ArticleService {
  final _articleRepository = ArticleRepository(dio);

  Future<(int, List<Article>)> fetchArticles({
    required int page,
    String? query,
  }) async {
    final httpResponse = await _articleRepository.fetchArticles(
      page: page,
      query: query,
    );
    return (httpResponse.maxPage, httpResponse.data);
  }
}
