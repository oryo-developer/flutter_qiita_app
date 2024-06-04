import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/repositories/theme_mode_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _themeModeRepository = ThemeModeRepository();

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) {
    final themeMode = _themeModeRepository.get();
    return ThemeModeNotifier(themeMode);
  },
);

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier(super._state);

  Future<void> change() async {
    final index = (state.index + 1) % 3;
    final themeMode = ThemeMode.values[index];
    final success = await _themeModeRepository.set(themeMode: themeMode);
    if (success) state = themeMode;
  }
}
