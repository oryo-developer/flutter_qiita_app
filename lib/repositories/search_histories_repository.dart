import 'package:flutter_qiita_app/main.dart';

class SearchHistoriesRepository {
  final _key = 'SEARCH_HISTORIES';

  List<String>? get() {
    return sharedPreferences.getStringList(_key);
  }

  Future<bool> set({required List<String> searchHistories}) {
    return sharedPreferences.setStringList(_key, searchHistories);
  }
}
