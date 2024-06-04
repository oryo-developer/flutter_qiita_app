import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/gen/assets.gen.dart';
import 'package:flutter_qiita_app/models/article/article.dart';

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
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
              child: Text(tag),
            );
          }).toList(),
        ),
        const SizedBox(height: 4),
        Row(children: [
          Assets.svgs.like.svg(width: 16, height: 16),
          const SizedBox(width: 2),
          Text(article.likesCount.toString()),
        ]),
      ],
    );
  }
}
