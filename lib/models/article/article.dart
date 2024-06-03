import 'package:flutter_qiita_app/converters/formatted_date_time_string_converter.dart';
import 'package:flutter_qiita_app/converters/tags_converter.dart';
import 'package:flutter_qiita_app/json.dart';
import 'package:flutter_qiita_app/models/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  const factory Article({
    @FormattedDateTimeStringConverter() required String createdAt,
    required int likesCount,
    @TagsConverter() required List<String> tags,
    required String title,
    required String url,
    required User user,
  }) = _Article;

  factory Article.fromJson(Json json) => _$ArticleFromJson(json);
}
