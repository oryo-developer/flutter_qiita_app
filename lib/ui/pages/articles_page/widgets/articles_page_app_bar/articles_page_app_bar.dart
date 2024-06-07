import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/ui/pages/articles_page/widgets/articles_page_app_bar/articles_page_search_text_field.dart';
import 'package:flutter_qiita_app/ui/widgets/change_theme_mode_button.dart';
import 'package:flutter_qiita_app/ui/widgets/logo.dart';

class ArticlesPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ArticlesPageAppBar({super.key});

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight + 72);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Logo(),
      actions: const [ChangeThemeModeButton(), SizedBox(width: 16)],
      bottom: const ArticlesPageSearchTextField(),
      centerTitle: true,
    );
  }
}
