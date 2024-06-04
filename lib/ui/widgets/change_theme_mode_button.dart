import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/extensions/build_context_extension.dart';
import 'package:flutter_qiita_app/extensions/theme_mode_extension.dart';
import 'package:flutter_qiita_app/ui/theme/theme_mode_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChangeThemeModeButton extends ConsumerWidget {
  const ChangeThemeModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: ref.read(themeModeProvider.notifier).change,
        child: Icon(themeMode.icon, color: context.themeColor.mediumEmphasis),
      ),
    );
  }
}
