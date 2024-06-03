import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/pages/articles_page/articles_page_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final articles = ref.watch(articlesPageProvider.select((state) {
          return state.articles;
        }));

        if (articles == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return Text(articles[index].title);
          },
        );
      }),
    );
  }
}
