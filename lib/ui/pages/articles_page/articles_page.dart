import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
      child: HookConsumer(builder: (context, ref, child) {
        final scrollController = useScrollController();
        final textEditingController = useTextEditingController(text: query);
        final focusNode = useFocusNode();
        return Scaffold(
          appBar: AppBar(
            title: GestureDetector(
              onTap: () async {
                await scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.linear,
                );
              },
              child: const Logo(),
            ),
            actions: const [ChangeThemeModeButton(), SizedBox(width: 16)],
            bottom: ArticlesPageAppBarBottom(
              textEditingController: textEditingController,
              focusNode: focusNode,
            ),
          ),
          body: ArticlesPageBody(
            scrollController: scrollController,
            textEditingController: textEditingController,
            focusNode: focusNode,
          ),
        );
      }),
    );
  }
}
