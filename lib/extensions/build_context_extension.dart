import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/ui/theme/theme_color/theme_color.dart';

extension BuildContextExtension on BuildContext {
  ThemeColor get themeColor {
    final brightness = Theme.of(this).brightness;
    return ThemeColor(brightness: brightness);
  }

  EdgeInsets padding({
    double? minLeft,
    double? minTop,
    double? minRight,
    double? minBottom,
  }) {
    return MediaQuery.paddingOf(this).copyWith(
      left: minLeft,
      top: minTop,
      right: minRight,
      bottom: minBottom,
    );
  }

  Future<T?> push<T>({required Widget widget}) {
    return Navigator.push(this, MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}
