import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/extensions/color_extension.dart';
import 'package:flutter_qiita_app/gen/assets.gen.dart';
import 'package:flutter_qiita_app/theme/theme_color/theme_color.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        color: ThemeColor.green60,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Assets.svgs.logo.svg(
        height: 18,
        colorFilter: ThemeColor.white.filter,
      ),
    );
  }
}
