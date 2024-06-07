import 'package:flutter/material.dart';

part 'dark_theme_color.dart';
part 'light_theme_color.dart';

abstract class ThemeColor {
  const ThemeColor._();

  factory ThemeColor({required Brightness brightness}) {
    return switch (brightness) {
      Brightness.dark => const DarkThemeColor(),
      Brightness.light => const LightThemeColor(),
    };
  }

  static const transparent = Color(0x00000000);
  static const white = Color(0xffffffff);
  static const gray10 = Color(0xfff5f6f6);
  static const gray20 = Color(0xffedeeee);
  static const gray80 = Color(0xff494b4b);
  static const gray100 = Color(0xff2f3232);
  static const gray110 = Color(0xff1d2020);
  static const black = Color(0xff000000);
  static const green60 = Color(0xff67cb1b);

  Color get background;
  Color get surface;
  Color get surfaceVariant;
  Color get highEmphasis;
  Color get mediumEmphasis;
  Color get divider;
  Color get disabled;
}
