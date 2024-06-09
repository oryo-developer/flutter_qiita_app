import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/extensions/brightness_extension.dart';
import 'package:flutter_qiita_app/ui/theme/theme_color/theme_color.dart';

class ThemeDataWithThemeColor {
  ThemeDataWithThemeColor._();

  static ThemeData get dark {
    return _themeData(brightness: Brightness.dark);
  }

  static ThemeData get light {
    return _themeData(brightness: Brightness.light);
  }

  static ThemeData _themeData({required Brightness brightness}) {
    final themeColor = ThemeColor(brightness: brightness);
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: themeColor.disabled),
        prefixIconColor: themeColor.disabled,
        suffixIconColor: themeColor.disabled,
        filled: true,
        fillColor: themeColor.surfaceVariant,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ThemeColor.green60, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ThemeColor.transparent, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      brightness: brightness,
      canvasColor: themeColor.surfaceVariant,
      colorScheme: brightness.colorScheme.copyWith(primary: ThemeColor.green60),
      scaffoldBackgroundColor: themeColor.background,
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: themeColor.highEmphasis,
          decorationColor: themeColor.highEmphasis,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: themeColor.surface,
        shadowColor: themeColor.divider,
        surfaceTintColor: ThemeColor.transparent,
        centerTitle: true,
      ),
    );
  }
}
