part of 'theme_color.dart';

class DarkThemeColor extends ThemeColor {
  const DarkThemeColor() : super._();

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
    return ThemeColor.white92;
  }

  @override
  Color get mediumEmphasis {
    return ThemeColor.white65;
  }

  @override
  Color get divider {
    return ThemeColor.white20;
  }

  @override
  Color get disabled {
    return ThemeColor.white43;
  }
}
