import 'package:flutter_qiita_app/json.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    String? name,
    String? organization,
    required String profileImageUrl,
  }) = _User;

  factory User.fromJson(Json json) => _$UserFromJson(json);
}
