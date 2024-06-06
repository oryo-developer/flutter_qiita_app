import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/ui/pages/articles_page/articles_page_provider.dart';
import 'package:flutter_qiita_app/ui/widgets/qiita_text_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticlesPageSearchTextField extends ConsumerWidget
    implements PreferredSizeWidget {
  const ArticlesPageSearchTextField({super.key});

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight + 16);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: QiitaTextField(
        textInputAction: TextInputAction.search,
        onSubmitted: (query) async {
          await ref
              .read(articlesPageProvider.notifier)
              .fetchFirstPageArticles(query: query);
        },
        hintText: '記事、質問を検索',
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
