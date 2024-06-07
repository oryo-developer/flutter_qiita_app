import 'package:flutter/material.dart';

extension BrightnessExtension on Brightness {
  ColorScheme get colorScheme {
    return switch (this) {
      Brightness.dark => const ColorScheme.dark(),
      Brightness.light => const ColorScheme.light(),
    };
  }
}
