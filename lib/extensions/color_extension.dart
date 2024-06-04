import 'package:flutter/material.dart';

extension ColorExtension on Color {
  ColorFilter get filter {
    return ColorFilter.mode(this, BlendMode.srcIn);
  }
}
