import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_qiita_app/extensions/build_context_extension.dart';
import 'package:flutter_qiita_app/extensions/color_extension.dart';
import 'package:flutter_qiita_app/gen/assets.gen.dart';
import 'package:flutter_qiita_app/providers/search_histories_provider.dart';
import 'package:flutter_qiita_app/theme/theme_color/theme_color.dart';
import 'package:flutter_qiita_app/widgets/pages/articles_page/articles_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchHistoryListView extends HookConsumerWidget {
  const SearchHistoryListView({
    super.key,
    required this.textEditingController,
    required this.focusNode,
  });

  final TextEditingController textEditingController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchHistories = useListenableSelector(textEditingController, () {
      final trimmedQuery = textEditingController.text.trim();
      final searchHistories = ref.watch(searchHistoriesProvider);
      return searchHistories.where((searchHistory) {
        final isContains = searchHistory.contains(trimmedQuery);
        final isNotEqual = searchHistory != trimmedQuery;
        return isContains && isNotEqual;
      }).toList();
    });
    return ColoredBox(
      color: context.themeColor.background,
      child: ListView.builder(
        itemBuilder: (context, index) {
          final searchHistory = searchHistories[index];
          return Dismissible(
            key: ValueKey(searchHistory),
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 16),
              color: ThemeColor.red60,
              child: const Icon(Icons.delete, color: ThemeColor.white),
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
                focusNode.unfocus();
                if (!context.mounted) return;
                await context.push(widget: ArticlesPage(query: searchHistory));
              },
              child: Container(
                padding: EdgeInsets.only(
                  left: 16,
                  top: index == 0 ? 8 : 4,
                  right: 16,
                  bottom: index == searchHistories.length - 1 ? 8 : 4,
                ),
                color: context.themeColor.surface,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(searchHistory),
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
