import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/ui/theme/theme_color/theme_color.dart';

extension BuildContextExtension on BuildContext {
  EdgeInsets get padding {
    return MediaQuery.paddingOf(this);
  }

  ThemeColor get themeColor {
    final brightness = Theme.of(this).brightness;
    return ThemeColor(brightness: brightness);
  }
}
