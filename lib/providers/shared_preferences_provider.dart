import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  //final historyList = ref.read(localHistoryProvider);
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
    } else {}
  }

List<String> getHistory() {
    return _preferences.getStringList(_historyKey) ?? [];
  }

  void setFavoriteIds (List<String> favoriteIds) {
    _preferences.setStringList(_favoriteKey, favoriteIds);
  }

  List<String> getFavoriteIds () {
    return _preferences.getStringList(_favoriteKey) ?? [];
  }
}
