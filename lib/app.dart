import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/ui/pages/articles_page/articles_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ArticlesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
