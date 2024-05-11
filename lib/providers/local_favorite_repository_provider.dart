import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_task/models/repository_model.dart';
import 'package:riverpod_test_task/providers/shared_preferences_provider.dart';

final listFavoriteRepositoryProvider =
    NotifierProvider<ListFavoriteRepository, List<RepositoryModel>>(
        ListFavoriteRepository.new);

class ListFavoriteRepository extends Notifier<List<RepositoryModel>> {
  @override
  List<RepositoryModel> build() {
    final prefs = ref.read(sharedPreferencesRepository);
    return prefs.getFavorites();
  }

  void add(RepositoryModel repository) {
    final prefs = ref.read(sharedPreferencesRepository);
    state = [
      ...state,
      repository,
    ];

    prefs.setFavoriteRepositories(state);
  }

  void toggle(RepositoryModel newRepository) {
    bool found = false;
    List<RepositoryModel> newState = [];

    for (final repository in state) {
      if (repository.id == newRepository.id) {
        found = true;
      } else {
        newState.add(repository);
      }
    }

    if (!found) {
      newState.add(newRepository);
    }

    state = newState;
    ref.read(sharedPreferencesRepository).setFavoriteRepositories(state);
  }

  void remove(RepositoryModel repository) {
    state = state.where((element) => element.id != repository.id).toList();
    ref.read(sharedPreferencesRepository).setFavoriteRepositories(state);
  }
}
