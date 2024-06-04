import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/extensions/build_context_extension.dart';
import 'package:flutter_qiita_app/extensions/user_extension.dart';
import 'package:flutter_qiita_app/models/article/article.dart';
import 'package:flutter_qiita_app/ui/widgets/launch_url.dart';

class ArticlesPageArticleHeader extends StatelessWidget {
  const ArticlesPageArticleHeader({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    final user = article.user;
    return Row(children: [
      LaunchUrl(
        'https://qiita.com/${user.id}',
        child: CircleAvatar(
          foregroundImage: NetworkImage(user.profileImageUrl),
          radius: 16,
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LaunchUrl(
              'https://qiita.com/${user.id}',
              child: Text(
                user.idAndName,
                style: const TextStyle(decoration: TextDecoration.underline),
              ),
            ),
            Text(
              article.createdAt,
              style: TextStyle(
                color: context.themeColor.mediumEmphasis,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
