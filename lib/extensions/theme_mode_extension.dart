import 'package:flutter/material.dart';

extension ThemeModeExtension on ThemeMode {
  IconData get icon {
    return switch (this) {
      ThemeMode.system => Icons.brightness_6,
      ThemeMode.light => Icons.light_mode,
      ThemeMode.dark => Icons.dark_mode,
    };
  }
}
