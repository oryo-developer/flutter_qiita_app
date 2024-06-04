import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/extensions/build_context_extension.dart';
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
      body: Consumer(builder: (context, ref, child) {
        final articles = ref.watch(articlesPageProvider.select((state) {
          return state.articles;
        }));

        if (articles == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: ref.read(articlesPageProvider.notifier).fetchArticles,
          child: ListView.separated(
            padding: EdgeInsets.only(top: 24, bottom: context.padding.bottom),
            itemCount: articles.length,
            itemBuilder: (_, index) {
              final article = articles[index];
              return LaunchUrlButton(
                article.url,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: context.themeColor.surface,
                  child: SafeArea(
                    top: false,
                    bottom: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ArticlesPageArticleHeader(article: article),
                        const SizedBox(height: 8),
                        Text(
                          article.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ArticlesPageArticleFooter(article: article),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
          ),
        );
      }),
    );
  }
}
