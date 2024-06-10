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
  static final white20 = white.withOpacity(0.2);
  static final white43 = white.withOpacity(0.43);
  static final white65 = white.withOpacity(0.65);
  static final white92 = white.withOpacity(0.92);
  static const gray10 = Color(0xfff5f6f6);
  static const gray20 = Color(0xffedeeee);
  static const gray80 = Color(0xff494b4b);
  static const gray100 = Color(0xff2f3232);
  static const gray110 = Color(0xff1d2020);
  static const black = Color(0xff000000);
  static final black12 = black.withOpacity(0.12);
  static final black38 = black.withOpacity(0.38);
  static final black60 = black.withOpacity(0.6);
  static final black87 = black.withOpacity(0.87);
  static const green60 = Color(0xff67cb1b);

  Color get background;
  Color get surface;
  Color get surfaceVariant;
  Color get highEmphasis;
  Color get mediumEmphasis;
  Color get divider;
  Color get disabled;
}
