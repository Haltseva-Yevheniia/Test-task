import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_task/providers/shared_preferences_provider.dart';

final localHistoryProvider =
    NotifierProvider<LocalSearchHistory, List<String>>(LocalSearchHistory.new);

class LocalSearchHistory extends Notifier<List<String>> {
  void addHistory(String? request) {
    if (request != null && request != '') {
      state = [...state, request];
      ref.read(sharedPreferencesRepository).setHistory(state);
    }
  }

  @override
  List<String> build() {
    return ref.read(sharedPreferencesRepository).getHistory();
  }
}
