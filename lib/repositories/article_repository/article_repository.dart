import 'package:dio/dio.dart';
import 'package:flutter_qiita_app/models/article/article.dart';
import 'package:retrofit/retrofit.dart';

part 'article_repository.g.dart';

@RestApi()
abstract class ArticleRepository {
  factory ArticleRepository(Dio dio, {String? baseUrl}) = _ArticleRepository;

  @GET('/items')
  Future<HttpResponse<List<Article>>> fetchArticles({
    @Query('page') required int page,
    @Query('query') String? query,
  });
}
