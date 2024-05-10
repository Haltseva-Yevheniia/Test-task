import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_task/models/repository_model.dart';
import 'package:riverpod_test_task/providers/repository_provider.dart';
import 'package:riverpod_test_task/providers/shared_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


final listFavIdProvider = NotifierProvider <ListFavId, List<String>>(ListFavId.new);


class ListFavId extends Notifier<List<String>> {

  @override
  List<String> build() {
    return [];
    //return ref.read(sharedPreferencesRepository).getFavoriteIds();
  }

  void toggle(String favId) {
    if (state.contains(favId)) {
      state = state.where((id) => id != favId).toList();
      ref.read(sharedPreferencesRepository).setFavoriteIds(state);
        } else {
      state = [...state, favId];
      ref.read(sharedPreferencesRepository).setFavoriteIds(state);
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