import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_qiita_app/extensions/build_context_extension.dart';
import 'package:flutter_qiita_app/extensions/color_extension.dart';
import 'package:flutter_qiita_app/extensions/listenable_extension.dart';
import 'package:flutter_qiita_app/gen/assets.gen.dart';
import 'package:flutter_qiita_app/providers/pages/articles_page_provider.dart';
import 'package:flutter_qiita_app/providers/search_histories_provider.dart';
import 'package:flutter_qiita_app/ui/theme/theme_color/theme_color.dart';
import 'package:flutter_qiita_app/ui/widgets/launch_url_button.dart';
import 'package:flutter_qiita_app/ui/widgets/pages/articles_page/articles_page.dart';
import 'package:flutter_qiita_app/ui/widgets/pages/articles_page/articles_page_article/articles_page_article_footer.dart';
import 'package:flutter_qiita_app/ui/widgets/pages/articles_page/articles_page_article/articles_page_article_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticlesPageBody extends HookConsumerWidget {
  const ArticlesPageBody({
    super.key,
    required this.scrollController,
    required this.textEditingController,
    required this.focusNode,
  });

  final ScrollController scrollController;
  final TextEditingController textEditingController;
  final FocusNode focusNode;

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
    scrollController.autoDisposeAddListener((controller) async {
      if (0.9 <= controller.offset / controller.position.maxScrollExtent) {
        await ref.read(articlesPageProvider.notifier).fetchNextPageArticles();
      }
    });
    final searchHistories = useListenableSelector(textEditingController, () {
      final searchHistories = ref.watch(searchHistoriesProvider);
      return searchHistories.where((searchHistory) {
        return searchHistory.contains(textEditingController.text);
      }).toList();
    });
    final hasPrimaryFocus = useListenableSelector(focusNode, () {
      return focusNode.hasPrimaryFocus;
    });
    return Stack(children: [
      RefreshIndicator(
        onRefresh:
            ref.read(articlesPageProvider.notifier).fetchFirstPageArticles,
        child: ListView.separated(
          controller: scrollController,
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
              height:
                  index == articles.length - 1 && !isNextPageArticlesFetching
                      ? 0
                      : 16,
            );
          },
          itemCount: articles.length + 1,
        ),
      ),
      if (hasPrimaryFocus)
        ColoredBox(
          color: context.themeColor.surface,
          child: ListView.builder(
            itemBuilder: (context, index) {
              final searchHistory = searchHistories[index];
              return Dismissible(
                key: ValueKey(searchHistory),
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16),
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: ThemeColor.white.withOpacity(0.65),
                  ),
                ),
                onDismissed: (direction) async {
                  await ref
                      .read(searchHistoriesProvider.notifier)
                      .remove(searchHistory: searchHistory);
                },
                direction: DismissDirection.endToStart,
                child: GestureDetector(
                  onTap: () async {
                    await ref
                        .read(searchHistoriesProvider.notifier)
                        .add(searchHistory: searchHistory);
                    if (!context.mounted) return;
                    await context.push(
                      widget: ArticlesPage(query: searchHistory),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    color: context.themeColor.surface,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(
                            Icons.history,
                            size: 16,
                            color: context.themeColor.mediumEmphasis,
                          ),
                          const SizedBox(width: 8),
                          Text(searchHistory),
                        ]),
                        GestureDetector(
                          onTap: () {
                            textEditingController.text = searchHistory;
                          },
                          child: Assets.svgs.arrowInsert.svg(
                            width: 24,
                            height: 24,
                            colorFilter:
                                context.themeColor.mediumEmphasis.filter,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: searchHistories.length,
          ),
        ),
    ]);
  }
}
