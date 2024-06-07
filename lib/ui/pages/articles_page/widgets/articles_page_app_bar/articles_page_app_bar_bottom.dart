import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_qiita_app/extensions/build_context_extension.dart';
import 'package:flutter_qiita_app/extensions/listenable_extension.dart';
import 'package:flutter_qiita_app/ui/pages/articles_page/articles_page.dart';
import 'package:flutter_qiita_app/ui/pages/articles_page/articles_page_provider.dart';
import 'package:flutter_qiita_app/ui/widgets/qiita_text_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticlesPageAppBarBottom extends HookConsumerWidget
    implements PreferredSizeWidget {
  const ArticlesPageAppBarBottom({super.key});

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(articlesPageProvider.select((state) {
      return state.query;
    }));
    final controller = useTextEditingController(text: query);

    final (focusNode, hasPrimaryFocus) = useFocusNode().listenableSelector(
      (focusNode) {
        return focusNode.hasPrimaryFocus;
      },
    );

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Row(children: [
        Expanded(
          child: QiitaTextField(
            controller: controller,
            focusNode: focusNode,
            textInputAction: TextInputAction.search,
            onSubmitted: (query) async {
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
