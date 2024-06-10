// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'articles_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ArticlesPageState {
  int get page => throw _privateConstructorUsedError;
  String? get query => throw _privateConstructorUsedError;
  int? get maxPage => throw _privateConstructorUsedError;
  bool get isFetchingNextPageArticles => throw _privateConstructorUsedError;
  List<Article>? get articles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticlesPageStateCopyWith<ArticlesPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesPageStateCopyWith<$Res> {
  factory $ArticlesPageStateCopyWith(
          ArticlesPageState value, $Res Function(ArticlesPageState) then) =
      _$ArticlesPageStateCopyWithImpl<$Res, ArticlesPageState>;
  @useResult
  $Res call(
      {int page,
      String? query,
      int? maxPage,
      bool isFetchingNextPageArticles,
      List<Article>? articles});
}

/// @nodoc
class _$ArticlesPageStateCopyWithImpl<$Res, $Val extends ArticlesPageState>
    implements $ArticlesPageStateCopyWith<$Res> {
  _$ArticlesPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? query = freezed,
    Object? maxPage = freezed,
    Object? isFetchingNextPageArticles = null,
    Object? articles = freezed,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      maxPage: freezed == maxPage
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int?,
      isFetchingNextPageArticles: null == isFetchingNextPageArticles
          ? _value.isFetchingNextPageArticles
          : isFetchingNextPageArticles // ignore: cast_nullable_to_non_nullable
              as bool,
      articles: freezed == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticlesPageStateImplCopyWith<$Res>
    implements $ArticlesPageStateCopyWith<$Res> {
  factory _$$ArticlesPageStateImplCopyWith(_$ArticlesPageStateImpl value,
          $Res Function(_$ArticlesPageStateImpl) then) =
      __$$ArticlesPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      String? query,
      int? maxPage,
      bool isFetchingNextPageArticles,
      List<Article>? articles});
}

/// @nodoc
class __$$ArticlesPageStateImplCopyWithImpl<$Res>
    extends _$ArticlesPageStateCopyWithImpl<$Res, _$ArticlesPageStateImpl>
    implements _$$ArticlesPageStateImplCopyWith<$Res> {
  __$$ArticlesPageStateImplCopyWithImpl(_$ArticlesPageStateImpl _value,
      $Res Function(_$ArticlesPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? query = freezed,
    Object? maxPage = freezed,
    Object? isFetchingNextPageArticles = null,
    Object? articles = freezed,
  }) {
    return _then(_$ArticlesPageStateImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      maxPage: freezed == maxPage
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int?,
      isFetchingNextPageArticles: null == isFetchingNextPageArticles
          ? _value.isFetchingNextPageArticles
          : isFetchingNextPageArticles // ignore: cast_nullable_to_non_nullable
              as bool,
      articles: freezed == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>?,
    ));
  }
}

/// @nodoc

class _$ArticlesPageStateImpl implements _ArticlesPageState {
  const _$ArticlesPageStateImpl(
      {this.page = 1,
      this.query,
      this.maxPage,
      this.isFetchingNextPageArticles = false,
      final List<Article>? articles})
      : _articles = articles;

  @override
  @JsonKey()
  final int page;
  @override
  final String? query;
  @override
  final int? maxPage;
  @override
  @JsonKey()
  final bool isFetchingNextPageArticles;
  final List<Article>? _articles;
  @override
  List<Article>? get articles {
    final value = _articles;
    if (value == null) return null;
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ArticlesPageState(page: $page, query: $query, maxPage: $maxPage, isFetchingNextPageArticles: $isFetchingNextPageArticles, articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticlesPageStateImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.maxPage, maxPage) || other.maxPage == maxPage) &&
            (identical(other.isFetchingNextPageArticles,
                    isFetchingNextPageArticles) ||
                other.isFetchingNextPageArticles ==
                    isFetchingNextPageArticles) &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      page,
      query,
      maxPage,
      isFetchingNextPageArticles,
      const DeepCollectionEquality().hash(_articles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticlesPageStateImplCopyWith<_$ArticlesPageStateImpl> get copyWith =>
      __$$ArticlesPageStateImplCopyWithImpl<_$ArticlesPageStateImpl>(
          this, _$identity);
}

abstract class _ArticlesPageState implements ArticlesPageState {
  const factory _ArticlesPageState(
      {final int page,
      final String? query,
      final int? maxPage,
      final bool isFetchingNextPageArticles,
      final List<Article>? articles}) = _$ArticlesPageStateImpl;

  @override
  int get page;
  @override
  String? get query;
  @override
  int? get maxPage;
  @override
  bool get isFetchingNextPageArticles;
  @override
  List<Article>? get articles;
  @override
  @JsonKey(ignore: true)
  _$$ArticlesPageStateImplCopyWith<_$ArticlesPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
