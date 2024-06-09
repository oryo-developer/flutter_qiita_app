import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/main.dart';

class ThemeModeRepository {
  final _key = 'THEME_MODE_INDEX';

  ThemeMode get() {
    final index = sharedPreferences.getInt(_key) ?? 0;
    return ThemeMode.values[index];
  }

  Future<bool> set({required ThemeMode themeMode}) {
    final index = themeMode.index;
    return sharedPreferences.setInt(_key, index);
  }
}
