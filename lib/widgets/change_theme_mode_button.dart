import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/extensions/theme_mode_extension.dart';
import 'package:flutter_qiita_app/providers/theme_mode_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChangeThemeModeButton extends ConsumerWidget {
  const ChangeThemeModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: ref.read(themeModeProvider.notifier).change,
      child: Icon(ref.watch(themeModeProvider).icon),
    );
  }
}
