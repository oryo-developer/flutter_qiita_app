import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/extensions/build_context_extension.dart';
import 'package:flutter_qiita_app/extensions/color_extension.dart';
import 'package:flutter_qiita_app/gen/assets.gen.dart';
import 'package:flutter_qiita_app/models/article/article.dart';
import 'package:flutter_qiita_app/widgets/launch_url_button.dart';

class ArticlesPageArticleFooter extends StatelessWidget {
  const ArticlesPageArticleFooter({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: article.tags.map((tag) {
            return LaunchUrlButton(
              urlString: 'https://qiita.com/tags/$tag',
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  color: context.themeColor.surfaceVariant,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    color: context.themeColor.mediumEmphasis,
                    decoration: TextDecoration.underline,
                    decorationColor: context.themeColor.mediumEmphasis,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 4),
        Row(children: [
          Assets.svgs.like.svg(
            width: 16,
            height: 16,
            colorFilter: context.themeColor.mediumEmphasis.filter,
          ),
          const SizedBox(width: 2),
          Text(article.likesCount.toString()),
        ]),
      ],
    );
  }
}
