part of 'theme_color.dart';

class LightThemeColor extends ThemeColor {
  const LightThemeColor() : super._();

  @override
  Color get background {
    return ThemeColor.gray10;
  }

  @override
  Color get surface {
    return ThemeColor.white;
  }

  @override
  Color get surfaceVariant {
    return ThemeColor.gray20;
  }

  @override
  Color get highEmphasis {
    return ThemeColor.black.withOpacity(0.87);
  }

  @override
  Color get mediumEmphasis {
    return ThemeColor.black.withOpacity(0.6);
  }

  @override
  Color get divider {
    return ThemeColor.black.withOpacity(0.12);
  }

  @override
  Color get disabled {
    return ThemeColor.black.withOpacity(0.38);
  }
}
