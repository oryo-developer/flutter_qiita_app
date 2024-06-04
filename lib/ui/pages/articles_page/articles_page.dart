import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/extensions/build_context_extension.dart';
import 'package:flutter_qiita_app/ui/pages/articles_page/articles_page_provider.dart';
import 'package:flutter_qiita_app/ui/pages/articles_page/widgets/articles_page_article_footer.dart';
import 'package:flutter_qiita_app/ui/pages/articles_page/widgets/articles_page_article_header.dart';
import 'package:flutter_qiita_app/ui/widgets/launch_url.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(builder: (context, ref, child) {
      final articles = ref.watch(articlesPageProvider.select((state) {
        return state.articles;
      }));

      if (articles == null) {
        return const Center(child: CircularProgressIndicator());
      }

      return ListView.separated(
        itemCount: articles.length,
        itemBuilder: (_, index) {
          final article = articles[index];
          return LaunchUrl(
            article.url,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: context.themeColor.surface,
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
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
      );
    }));
  }
}
