import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/extensions/build_context_extension.dart';
import 'package:flutter_qiita_app/extensions/listenable_extension.dart';
import 'package:flutter_qiita_app/providers/pages/articles_page_provider.dart';
import 'package:flutter_qiita_app/widgets/pages/articles_page/articles_page_article_list_view/articles_page_article_list_item/articles_page_article_list_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticlesPageArticleListView extends HookConsumerWidget {
  const ArticlesPageArticleListView({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(articlesPageProvider.select((state) {
      return state.articles;
    }));
    if (articles == null) {
      return const Center(child: CircularProgressIndicator());
    }
    final isFetchingNextPageArticles = ref.watch(
      articlesPageProvider.select((state) {
        return state.isFetchingNextPageArticles;
      }),
    );
    scrollController.autoDisposeListener((controller) async {
      if (0.9 <= controller.offset / controller.position.maxScrollExtent) {
        await ref.read(articlesPageProvider.notifier).fetchNextPageArticles();
      }
    });
    return RefreshIndicator(
      onRefresh: ref.read(articlesPageProvider.notifier).fetchFirstPageArticles,
      child: ListView.separated(
        controller: scrollController,
        padding: EdgeInsets.only(
          top: 24,
          bottom: context.padding(minBottom: 24).bottom,
        ),
        itemBuilder: (_, index) {
          if (index == articles.length) {
            return Visibility(
              visible: isFetchingNextPageArticles,
              child: const Center(child: CircularProgressIndicator()),
            );
          }
          return ArticlesPageArticleListItem(article: articles[index]);
        },
        separatorBuilder: (context, index) {
          final isLast = index == articles.length - 1;
          return SizedBox(
            height: isLast && !isFetchingNextPageArticles ? 0 : 16,
          );
        },
        itemCount: articles.length + 1,
      ),
    );
  }
}
