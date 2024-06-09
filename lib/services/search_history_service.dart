import 'package:flutter_qiita_app/repositories/search_histories_repository.dart';

class SearchHistoryService {
  final _searchHistoriesRepository = SearchHistoriesRepository();

  List<String> get() {
    return _searchHistoriesRepository.get() ?? [];
  }

  Future<bool> add({required String searchHistory}) async {
    final failure = !(await _removeIfContains(searchHistory: searchHistory));
    if (failure) return Future.value(false);
    final searchHistories = get();
    searchHistories.insert(0, searchHistory);
    return _searchHistoriesRepository.set(searchHistories: searchHistories);
  }

  Future<bool> remove({required String searchHistory}) {
    final searchHistories = get();
    final failure = !searchHistories.remove(searchHistory);
    if (failure) return Future.value(false);
    return _searchHistoriesRepository.set(searchHistories: searchHistories);
  }

  Future<bool> _removeIfContains({required String searchHistory}) async {
    final searchHistories = get();
    final isNotContains = !searchHistories.contains(searchHistory);
    if (isNotContains) return Future.value(true);
    if (searchHistory == searchHistories.first) return Future.value(false);
    return remove(searchHistory: searchHistory);
  }
}
