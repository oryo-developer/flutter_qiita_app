import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/repositories/theme_mode_index_repository.dart';

class ThemeModeService {
  final _themeModeIndexRepository = ThemeModeIndexRepository();

  ThemeMode get() {
    final index = _themeModeIndexRepository.get() ?? 0;
    return ThemeMode.values[index];
  }

  Future<bool> set({required ThemeMode themeMode}) {
    final index = themeMode.index;
    return _themeModeIndexRepository.set(index: index);
  }
}
