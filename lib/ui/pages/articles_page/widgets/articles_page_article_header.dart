import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/extensions/user_extension.dart';
import 'package:flutter_qiita_app/models/article/article.dart';

class ArticlesPageArticleHeader extends StatelessWidget {
  const ArticlesPageArticleHeader({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CircleAvatar(
        foregroundImage: NetworkImage(article.user.profileImageUrl),
        radius: 16,
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: article.user.idAndName,
                  style: const TextStyle(decoration: TextDecoration.underline),
                ),
                if (article.user.organization.isNotEmpty)
                  TextSpan(children: [
                    const TextSpan(text: ' in '),
                    TextSpan(
                      text: article.user.organization,
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ]),
              ],
            )),
            Text(article.createdAt, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    ]);
  }
}
