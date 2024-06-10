import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/extensions/build_context_extension.dart';
import 'package:flutter_qiita_app/models/article/article.dart';
import 'package:flutter_qiita_app/widgets/launch_url_button.dart';
import 'package:flutter_qiita_app/widgets/pages/articles_page/articles_page_article_list_view/articles_page_article_list_item/articles_page_article_list_item_footer.dart';
import 'package:flutter_qiita_app/widgets/pages/articles_page/articles_page_article_list_view/articles_page_article_list_item/articles_page_article_list_item_header.dart';

class ArticlesPageArticleListItem extends StatelessWidget {
  const ArticlesPageArticleListItem({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return LaunchUrlButton(
      urlString: article.url,
      child: Container(
        padding: const EdgeInsets.all(16),
        color: context.themeColor.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ArticlesPageArticleListItemHeader(article: article),
            const SizedBox(height: 8),
            Text(
              article.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ArticlesPageArticleListItemFooter(article: article),
          ],
        ),
      ),
    );
  }
}
