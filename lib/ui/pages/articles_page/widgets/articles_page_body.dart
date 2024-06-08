import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_qiita_app/extensions/build_context_extension.dart';
import 'package:flutter_qiita_app/extensions/listenable_extension.dart';
import 'package:flutter_qiita_app/ui/pages/articles_page/articles_page_provider.dart';
import 'package:flutter_qiita_app/ui/pages/articles_page/widgets/articles_page_article/articles_page_article_footer.dart';
import 'package:flutter_qiita_app/ui/pages/articles_page/widgets/articles_page_article/articles_page_article_header.dart';
import 'package:flutter_qiita_app/ui/widgets/launch_url_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticlesPageBody extends HookConsumerWidget {
  const ArticlesPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(articlesPageProvider.select((state) {
      return state.articles;
    }));
    if (articles == null) {
      return const Center(child: CircularProgressIndicator());
    }
    final isNextPageArticlesFetching = ref.watch(
      articlesPageProvider.select((state) {
        return state.isNextPageArticlesFetching;
      }),
    );
    final controller = useScrollController()
      ..autoDisposeAddListener((controller) async {
        if (0.9 <= controller.offset / controller.position.maxScrollExtent) {
          await ref.read(articlesPageProvider.notifier).fetchNextPageArticles();
        }
      });
    return RefreshIndicator(
      onRefresh: ref.read(articlesPageProvider.notifier).fetchFirstPageArticles,
      child: ListView.separated(
        controller: controller,
        padding: EdgeInsets.only(
          top: 24,
          bottom: context.padding(minBottom: 24).bottom,
        ),
        itemBuilder: (_, index) {
          if (index == articles.length) {
            return Visibility(
              visible: isNextPageArticlesFetching,
              child: const Center(child: CircularProgressIndicator()),
            );
          }
          return LaunchUrlButton(
            urlString: articles[index].url,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: context.themeColor.surface,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ArticlesPageArticleHeader(article: articles[index]),
                  const SizedBox(height: 8),
                  Text(
                    articles[index].title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ArticlesPageArticleFooter(article: articles[index]),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: index == articles.length - 1 && !isNextPageArticlesFetching
                ? 0
                : 16,
          );
        },
        itemCount: articles.length + 1,
      ),
    );
  }
}
