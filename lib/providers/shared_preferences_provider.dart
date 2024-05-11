import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_task/models/repository_model.dart';
import 'package:riverpod_test_task/providers/local_history.dart';
import 'package:shared_preferences/shared_preferences.dart';


// final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) {
//   return SharedPreferences.getInstance();
// });
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {

throw UnimplementedError();
});

final sharedPreferencesRepository = Provider<SharedPreferencesRepository>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
   return SharedPreferencesRepository(preferences: sharedPrefs);
});

class SharedPreferencesRepository {
  final SharedPreferences _preferences;
  static const  String _historyKey= 'history';
  static const String _favoriteKey = 'favorites';

  SharedPreferencesRepository({required SharedPreferences preferences})
      : _preferences=preferences;

  void setHistory(List<String> historyList) {
    if (historyList.isNotEmpty) {
      _preferences.setStringList(_historyKey, historyList);
    }
  }

List<String> getHistory() {
    return _preferences.getStringList(_historyKey) ?? [];
  }

  void setFavoriteRepositories (List<RepositoryModel> repositories) {
  // jsonEncode makes from Map String
    List<String> list = [];
    for (final repository in repositories) {
      list.add(jsonEncode(repository));
    }
    _preferences.setStringList(_favoriteKey, list);
  }

  List<RepositoryModel> getFavorites () {
    List<RepositoryModel> favoriteList= [];
     final list =_preferences.getStringList(_favoriteKey) ?? [];
     for (final string in list) {
       final decodeString = jsonDecode(string);
       favoriteList.add(RepositoryModel.fromJson(decodeString));
     }

    return favoriteList;
  }
}
