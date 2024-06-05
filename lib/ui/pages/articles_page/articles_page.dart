import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_qiita_app/extensions/build_context_extension.dart';
import 'package:flutter_qiita_app/extensions/listenable_extension.dart';
import 'package:flutter_qiita_app/ui/pages/articles_page/articles_page_provider.dart';
import 'package:flutter_qiita_app/ui/pages/articles_page/widgets/articles_page_article_footer.dart';
import 'package:flutter_qiita_app/ui/pages/articles_page/widgets/articles_page_article_header.dart';
import 'package:flutter_qiita_app/ui/widgets/change_theme_mode_button.dart';
import 'package:flutter_qiita_app/ui/widgets/launch_url_button.dart';
import 'package:flutter_qiita_app/ui/widgets/logo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
        actions: const [ChangeThemeModeButton()],
      ),
      body: HookConsumer(builder: (context, ref, child) {
        final (articles) = ref.watch(articlesPageProvider.select((state) {
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
          ..addAutoDisposeListener((controller) async {
            final maxScrollExtent = controller.position.maxScrollExtent;
            final scrollRatio = controller.offset / maxScrollExtent;
            if (0.8 <= scrollRatio) {
              await ref
                  .read(articlesPageProvider.notifier)
                  .fetchNextPageArticles();
            }
          });

        return RefreshIndicator(
          onRefresh:
              ref.read(articlesPageProvider.notifier).fetchFirstPageArticles,
          child: ListView.separated(
            controller: controller,
            padding: EdgeInsets.only(top: 24, bottom: context.padding.bottom),
            itemCount: articles.length + 1,
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
                  child: SafeArea(
                    top: false,
                    bottom: false,
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
                ),
              );
            },
            separatorBuilder: (context, index) {
              if (index == articles.length - 1) {
                return SizedBox(height: isNextPageArticlesFetching ? 16 : 0);
              }

              return const SizedBox(height: 16);
            },
          ),
        );
      }),
    );
  }
}
