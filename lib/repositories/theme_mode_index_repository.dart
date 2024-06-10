import 'package:flutter_qiita_app/shared_preferences.dart';

class ThemeModeIndexRepository {
  final _key = 'THEME_MODE_INDEX';

  int? get() {
    return sharedPreferences.getInt(_key);
  }

  Future<bool> set({required int index}) {
    return sharedPreferences.setInt(_key, index);
  }
}
