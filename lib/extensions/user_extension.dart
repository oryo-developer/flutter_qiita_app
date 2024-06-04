import 'package:flutter_qiita_app/models/user/user.dart';

extension UserExtension on User {
  String get idAndName {
    final id = '@${this.id}';
    if (name.isEmpty) return id;
    return '$id ($name)';
  }
}
