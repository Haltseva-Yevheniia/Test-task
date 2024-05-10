import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_task/models/repository_model.dart';
import 'package:riverpod_test_task/providers/repository_provider.dart';
import 'package:riverpod_test_task/providers/shared_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// final localFavoriteProvider =
// NotifierProvider<LocalFavoriteRepository, List<RepositoryModel>>(
//         LocalFavoriteRepository.new);

// final listFavIdProvider = StateProvider<List<String>>((ref) {
//   final List<RepositoryModel> repositories = ref.read(repositoryProvider).value ?? [];
//   final List<RepositoryModel> favoriteRepositories = (repositories != null)
//       ? repositories.where((element) => element.isFavorite == true).toList()
//       : [];
//   return favoriteRepositories.map((e) => e.id.toString()).toList();
// });

final listFavIdProvider = StateNotifierProvider <ListFavId, List<String>>((
    ref) {
  ref.read(sharedPreferencesRepository);
  return ListFavId();
});

class ListFavId extends StateNotifier<List<String>> {
  //final SharedPreferences prefs;


  ListFavId() : super ([]);


  @override
  List<String> build() {
    //final list = ref.read(listFavIdProvider);
    return state;
  }

  void toggle(String favId) {
    if (state.contains(favId)) {
      state = state.where((id) => id != favId).toList();
    } else {
      state = [...state, favId];
    }
  }

}


final listFavoriteRepositoryProvider =
NotifierProvider<ListFavoriteRepository, List<RepositoryModel>>(
    ListFavoriteRepository.new);

class ListFavoriteRepository extends Notifier<List<RepositoryModel>> {
  @override
  List<RepositoryModel> build() {
    final repositories = ref
        .read(repositoryProvider)
        .value;
    final favIds = ref.read(listFavIdProvider);
    // final favRepository =
    // for (String id in favIds) {
    //   if (repositories)
    // }
    // return repositories.where((element) =>
    //     element.id.toString().contains(favIds);

    return state ?? [];
  }
}