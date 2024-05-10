import 'dart:convert';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_test_task/models/repository_model.dart';
import 'package:riverpod_test_task/providers/request_provider.dart';

import '../constants.dart';

final pageProvider = StateProvider<int>((ref) => 1);

final repositoryProvider =
    FutureProvider.autoDispose<List<RepositoryModel>>((ref) async {

  final name = ref.watch(requestProvider.notifier).state;
  final page = ref.watch(pageProvider.notifier).state;
  return fetchRepositories(name: name, page: page);
});

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
  return repositories;} catch (e) {
    print (e);
    return [];
  }
}

void logResponse(http.Response response) {
  log('${response.request?.method.toUpperCase()} \n${response.request?.url}  \n${response.statusCode} \n${response.body.toString()} ');
}
