import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/ui/pages/articles_page/articles_page_provider.dart';
import 'package:flutter_qiita_app/ui/pages/articles_page/widgets/articles_page_app_bar_bottom.dart';
import 'package:flutter_qiita_app/ui/pages/articles_page/widgets/articles_page_body.dart';
import 'package:flutter_qiita_app/ui/widgets/change_theme_mode_button.dart';
import 'package:flutter_qiita_app/ui/widgets/logo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key, this.query});

  final String? query;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        articlesPageProvider.overrideWith((ref) {
          return ArticlesPageNotifier(query: query);
        }),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Logo(),
          actions: const [ChangeThemeModeButton(), SizedBox(width: 16)],
          bottom: const ArticlesPageAppBarBottom(),
        ),
        body: const ArticlesPageBody(),
      ),
    );
  }
}
