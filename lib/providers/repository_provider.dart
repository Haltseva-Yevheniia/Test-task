import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_test_task/models/repository_model.dart';
import 'package:riverpod_test_task/providers/request_provider.dart';

import '../constants.dart';

final pageProvider = StateProvider<int>((ref) => 1);

void logResponse(http.Response response) {
  log('${response.request?.method.toUpperCase()} \n${response.request?.url}  \n${response.statusCode} \n${response.body.toString()} ');
}

final repositoriesProvider = NotifierProvider <Repositories, List<RepositoryModel>> (Repositories.new);


class Repositories extends Notifier <List<RepositoryModel> >{
  @override
  build() {
    return ref.read(repositoryProvider).value ?? [];
  }

  void addRepositories () {
     ref.read(pageProvider.notifier).state++;
    final repositories = ref.read(repositoryProvider).value;

      state = [...state, ...?repositories];

  }

}

final repositoryProvider = FutureProvider<List<RepositoryModel>>((ref) async {
  final name = ref.watch(requestProvider);

  final page = ref.watch(pageProvider);
  return ref.watch(apiServiceProvider).fetchRepositories(name: name, page:page);
});

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {

  Future<List<RepositoryModel>> fetchRepositories(
      {required String name, int? page = 1}) async {
    try {
      Uri url = Uri.https(baseURL, pathURL, {
        'q': name,
        'per_page': '$searchResultsOutput',
        'page': '$page',
      });
      final response = await http.get(url, headers: headers);

      if (response.statusCode != 200) {
        throw Exception('Error. Status code is ${response.statusCode}');
      }
      if (response.body.isEmpty) {
        throw Exception('The list of items is empty');
      }
      final data = jsonDecode(response.body);

      List<RepositoryModel> repositories =
          List<RepositoryModel>.from(data['items'].map(
        (item) => RepositoryModel.fromJson(item),
      ));
      logResponse(response);
      return repositories;
    } catch (e) {
      print(e);
      return [];
    }
  }
}


