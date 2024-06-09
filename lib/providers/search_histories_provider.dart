import 'package:flutter_qiita_app/services/search_history_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _searchHistoryService = SearchHistoryService();

final searchHistoriesProvider =
    StateNotifierProvider<SearchHistoriesNotifier, List<String>>((ref) {
  return SearchHistoriesNotifier();
});

class SearchHistoriesNotifier extends StateNotifier<List<String>> {
  SearchHistoriesNotifier() : super(_searchHistoryService.get());

  Future<void> add({required String searchHistory}) async {
    final success = await _searchHistoryService.add(
      searchHistory: searchHistory,
    );
    if (success) state = _searchHistoryService.get();
  }

  Future<void> remove({required String searchHistory}) async {
    final success = await _searchHistoryService.remove(
      searchHistory: searchHistory,
    );
    if (success) state = _searchHistoryService.get();
  }
}
