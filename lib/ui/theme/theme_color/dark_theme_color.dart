import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/ui/theme/theme_color/theme_color.dart';

class DarkThemeColor extends ThemeColor {
  @override
  Color get background {
    return ThemeColor.gray110;
  }

  @override
  Color get surface {
    return ThemeColor.gray100;
  }

  @override
  Color get surfaceVariant {
    return ThemeColor.gray80;
  }

  @override
  Color get highEmphasis {
    return ThemeColor.white.withOpacity(0.92);
  }

  @override
  Color get mediumEmphasis {
    return ThemeColor.white.withOpacity(0.65);
  }

  @override
  Color get divider {
    return ThemeColor.white.withOpacity(0.2);
  }
}
