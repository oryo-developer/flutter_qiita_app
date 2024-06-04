import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/ui/theme/theme_color/theme_color.dart';

class ThemeDataWithThemeColor {
  ThemeDataWithThemeColor._();

  static ThemeData get light {
    return _themeData(brightness: Brightness.light);
  }

  static ThemeData get dark {
    return _themeData(brightness: Brightness.dark);
  }

  static ThemeData _themeData({required Brightness brightness}) {
    final themeColor = ThemeColor.brightness(brightness: brightness);
    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: themeColor.background,
    );
  }
}
