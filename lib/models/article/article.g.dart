// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      createdAt:
          const CreatedAtConverter().fromJson(json['created_at'] as String),
      likesCount: (json['likes_count'] as num).toInt(),
      tags: const TagsConverter().fromJson(json['tags'] as List),
      title: json['title'] as String,
      url: json['url'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'created_at': const CreatedAtConverter().toJson(instance.createdAt),
      'likes_count': instance.likesCount,
      'tags': const TagsConverter().toJson(instance.tags),
      'title': instance.title,
      'url': instance.url,
      'user': instance.user,
    };
