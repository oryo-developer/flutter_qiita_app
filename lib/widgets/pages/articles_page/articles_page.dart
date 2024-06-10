import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_qiita_app/extensions/listenable_extension.dart';
import 'package:flutter_qiita_app/extensions/theme_mode_extension.dart';
import 'package:flutter_qiita_app/providers/pages/articles_page_provider.dart';
import 'package:flutter_qiita_app/providers/theme_mode_provider.dart';
import 'package:flutter_qiita_app/widgets/logo.dart';
import 'package:flutter_qiita_app/widgets/pages/articles_page/articles_page_app_bar_bottom.dart';
import 'package:flutter_qiita_app/widgets/pages/articles_page/articles_page_article_list_view/articles_page_article_list_view.dart';
import 'package:flutter_qiita_app/widgets/search_history_list_view.dart';
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
        final articleListViewScrollController = useScrollController();
        final searchHistoryListViewScrollController = useScrollController();
        final textEditingController = useTextEditingController(text: query);
        final (focusNode, hasPrimaryFocus) = useFocusNode().listenableSelector(
          (focusNode) {
            return focusNode.hasPrimaryFocus;
          },
        );
        return Scaffold(
          appBar: AppBar(
            title: GestureDetector(
              onTap: () async {
                final scrollController = hasPrimaryFocus
                    ? searchHistoryListViewScrollController
                    : articleListViewScrollController;
                await scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                );
              },
              child: const Logo(),
            ),
            actions: [
              GestureDetector(
                onTap: ref.read(themeModeProvider.notifier).change,
                child: Icon(ref.watch(themeModeProvider).icon),
              ),
              const SizedBox(width: 16),
            ],
            bottom: ArticlesPageAppBarBottom(
              textEditingController: textEditingController,
              focusNode: focusNode,
            ),
          ),
          body: Stack(children: [
            ArticlesPageArticleListView(
              scrollController: articleListViewScrollController,
            ),
            if (hasPrimaryFocus)
              SearchHistoryListView(
                scrollController: searchHistoryListViewScrollController,
                textEditingController: textEditingController,
                focusNode: focusNode,
              ),
          ]),
        );
      }),
    );
  }
}
