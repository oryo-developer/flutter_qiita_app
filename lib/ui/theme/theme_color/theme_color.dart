import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/ui/theme/theme_color/dark_theme_color.dart';
import 'package:flutter_qiita_app/ui/theme/theme_color/light_theme_color.dart';

abstract class ThemeColor {
  static const white = Color(0xffffffff);
  static const gray10 = Color(0xfff5f6f6);
  static const gray20 = Color(0xffedeeee);
  static const gray80 = Color(0xff494b4b);
  static const gray100 = Color(0xff2f3232);
  static const gray110 = Color(0xff1d2020);
  static const black = Color(0xff000000);

  Color get background;
  Color get surface;
  Color get surfaceVariant;
  Color get highEmphasis;
  Color get mediumEmphasis;

  static ThemeColor brightness({required Brightness brightness}) {
    return switch (brightness) {
      Brightness.light => LightThemeColor(),
      Brightness.dark => DarkThemeColor(),
    };
  }
}
