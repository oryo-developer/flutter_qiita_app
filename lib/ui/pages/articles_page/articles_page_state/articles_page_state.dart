import 'package:flutter_qiita_app/models/article/article.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'articles_page_state.freezed.dart';

@freezed
class ArticlesPageState with _$ArticlesPageState {
  const factory ArticlesPageState({
    @Default(1) int page,
    int? maxPage,
    @Default(false) bool isNextPageArticlesFetching,
    List<Article>? articles,
  }) = _ArticlesPageState;
}
