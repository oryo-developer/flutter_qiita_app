import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/extensions/build_context_extension.dart';
import 'package:flutter_qiita_app/extensions/color_extension.dart';
import 'package:flutter_qiita_app/gen/assets.gen.dart';
import 'package:flutter_qiita_app/providers/search_histories_provider.dart';
import 'package:flutter_qiita_app/theme/theme_color/theme_color.dart';
import 'package:flutter_qiita_app/widgets/pages/articles_page/articles_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchHistoryListView extends ConsumerWidget {
  const SearchHistoryListView({super.key, required this.textEditingController});

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchHistories = ref.watch(searchHistoriesProvider);
    return ColoredBox(
      color: context.themeColor.surface,
      child: ListView.builder(
        itemBuilder: (context, index) {
          final searchHistory = searchHistories[index];
          return Dismissible(
            key: ValueKey(searchHistory),
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 16),
              color: Colors.red,
              child: Icon(Icons.delete, color: ThemeColor.white65),
            ),
            onDismissed: (direction) async {
              await ref
                  .read(searchHistoriesProvider.notifier)
                  .remove(searchHistory: searchHistory);
            },
            direction: DismissDirection.endToStart,
            child: GestureDetector(
              onTap: () async {
                await ref
                    .read(searchHistoriesProvider.notifier)
                    .add(searchHistory: searchHistory);
                if (!context.mounted) return;
                await context.push(widget: ArticlesPage(query: searchHistory));
              },
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                color: context.themeColor.surface,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const Icon(Icons.history, size: 16),
                      const SizedBox(width: 8),
                      Text(searchHistory),
                    ]),
                    GestureDetector(
                      onTap: () {
                        textEditingController.text = searchHistory;
                      },
                      child: Assets.svgs.arrowInsert.svg(
                        width: 24,
                        height: 24,
                        colorFilter: context.themeColor.mediumEmphasis.filter,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: searchHistories.length,
      ),
    );
  }
}
