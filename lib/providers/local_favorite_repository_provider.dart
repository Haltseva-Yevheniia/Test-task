import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_task/models/repository_model.dart';

import 'package:riverpod_test_task/providers/shared_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


// final listFavIdProvider = NotifierProvider <ListFavId, List<String>>(ListFavId.new);
//
//
// class ListFavId extends Notifier<List<String>> {
//
//   @override
//   List<String> build() {
//         return ref.read(sharedPreferencesRepository).getFavorites();
//   }
//
//   void addFavoriteId(String? id) {
//     if (id != null && id != '') {
//       state = [...state, id];
//       ref.read(sharedPreferencesRepository).setFavoriteRepositories(state);
//     } }
//
//   void removeFavoriteId (String? id) {
//     state.remove(id);
//     ref.read(sharedPreferencesRepository).setFavoriteRepositories(state);
//   }
//
//   void toggle(String favId) {
//     if (state.contains(favId)) {
//       //state = state.where((id) => id != favId).toList();
//       state.remove(favId);
//       //print(state);
//       ref.read(sharedPreferencesRepository).setFavoriteRepositories(state);
//         } else {
//       state = [...state, favId];
//       ref.read(sharedPreferencesRepository).setFavoriteRepositories(state);
//     }
//
//
// }}


final listFavoriteRepositoryProvider =
NotifierProvider<ListFavoriteRepository, List<RepositoryModel>>(
    ListFavoriteRepository.new);

class ListFavoriteRepository extends Notifier<List<RepositoryModel>> {
  @override
  List<RepositoryModel> build() =>[];

  void add (RepositoryModel repository) {
    state = [...state, repository];
  
    ref.read(sharedPreferencesRepository).setFavoriteRepositories(state);
  }

  void toggle  (String favId) {
    state = [
      for(final repository in state)
        if (repository.id.toString() == favId)
          RepositoryModel(name: repository.name, id: repository.id, isFavorite: !repository.isFavorite)
      else repository
    ];
    ref.read(sharedPreferencesRepository).setFavoriteRepositories(state);
  }


  void remove (RepositoryModel repository) {
    state = state.where((rep) => rep.id != repository.id).toList();
    ref.read(sharedPreferencesRepository).setFavoriteRepositories(state);
  }

}