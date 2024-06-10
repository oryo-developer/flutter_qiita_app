import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_qiita_app/extensions/build_context_extension.dart';
import 'package:flutter_qiita_app/providers/search_histories_provider.dart';
import 'package:flutter_qiita_app/widgets/pages/articles_page/articles_page.dart';
import 'package:flutter_qiita_app/widgets/qiita_text_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticlesPageAppBarBottom extends HookConsumerWidget
    implements PreferredSizeWidget {
  const ArticlesPageAppBarBottom({
    super.key,
    required this.textEditingController,
    required this.focusNode,
  });

  final TextEditingController textEditingController;
  final FocusNode focusNode;

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight + 16);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasPrimaryFocus = useListenableSelector(focusNode, () {
      return focusNode.hasPrimaryFocus;
    });
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Row(children: [
        Expanded(
          child: QiitaTextField(
            controller: textEditingController,
            focusNode: focusNode,
            textInputAction: TextInputAction.search,
            onSubmitted: (query) async {
              await ref
                  .read(searchHistoriesProvider.notifier)
                  .add(searchHistory: query);
              if (!context.mounted) return;
              await context.push(widget: ArticlesPage(query: query));
            },
            hintText: '記事、質問を検索',
            prefixIcon: const Icon(Icons.search),
          ),
        ),
        if (hasPrimaryFocus)
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: GestureDetector(
              onTap: focusNode.unfocus,
              child: const Text(
                'キャンセル',
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
      ]),
    );
  }
}
