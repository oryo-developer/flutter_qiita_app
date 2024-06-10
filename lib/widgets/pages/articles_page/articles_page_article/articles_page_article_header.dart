import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/extensions/build_context_extension.dart';
import 'package:flutter_qiita_app/gen/assets.gen.dart';
import 'package:flutter_qiita_app/models/article/article.dart';
import 'package:flutter_qiita_app/widgets/launch_url_button.dart';

class ArticlesPageArticleHeader extends StatelessWidget {
  const ArticlesPageArticleHeader({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      LaunchUrlButton(
        urlString: 'https://qiita.com/${article.user.id}',
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: article.user.profileImageUrl,
            errorWidget: (context, url, error) {
              return Assets.images.icon.image();
            },
            width: 32,
            height: 32,
          ),
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LaunchUrlButton(
              urlString: 'https://qiita.com/${article.user.id}',
              child: Text(
                article.user.idAndName,
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
