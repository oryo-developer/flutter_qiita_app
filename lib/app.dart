import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/ui/pages/articles_page/articles_page.dart';
import 'package:flutter_qiita_app/ui/theme/theme_data_with_theme_color.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ArticlesPage(),
      theme: ThemeDataWithThemeColor.light,
      darkTheme: ThemeDataWithThemeColor.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
