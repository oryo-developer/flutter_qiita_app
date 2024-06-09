import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/providers/theme_mode_provider.dart';
import 'package:flutter_qiita_app/ui/theme/theme_data_with_theme_color.dart';
import 'package:flutter_qiita_app/ui/widgets/pages/articles_page/articles_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: const ArticlesPage(),
      theme: ThemeDataWithThemeColor.light,
      darkTheme: ThemeDataWithThemeColor.dark,
      themeMode: ref.watch(themeModeProvider),
      debugShowCheckedModeBanner: false,
    );
  }
}
