import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/services/theme_mode_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _themeModeService = ThemeModeService();

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) {
    return ThemeModeNotifier();
  },
);

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(_themeModeService.get());

  Future<void> change() async {
    final index = (state.index + 1) % ThemeMode.values.length;
    final themeMode = ThemeMode.values[index];
    final success = await _themeModeService.set(themeMode: themeMode);
    if (success) state = themeMode;
  }
}
