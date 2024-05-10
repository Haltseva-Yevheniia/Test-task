import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_task/constants.dart';
import 'package:riverpod_test_task/models/repository_model.dart';
import 'package:riverpod_test_task/providers/local_favorite_repository_provider.dart';
import 'package:riverpod_test_task/providers/repository_provider.dart';
import 'package:riverpod_test_task/style/style.dart';
import 'package:riverpod_test_task/widgets/failure_state_widget.dart';
import 'package:riverpod_test_task/widgets/icon_star.dart';
import 'package:riverpod_test_task/widgets/leading_appbar.dart';
import 'package:riverpod_test_task/widgets/search_card.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repositories = ref.watch(repositoryProvider).value;

    //final List <RepositoryModel> favoriteRepositories = ref.watch(listFavoriteRepositoryProvider);
    final List<String> favIds = ref.watch(listFavIdProvider);

    final List<RepositoryModel> favoriteList = (repositories != null)
        ? repositories
            .where((element) => favIds.contains(element.id.toString()))
            .toList()
        : [];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          navigationBarFavoriteScreen,
          style: FontStyles.headerMain,
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: const LeadingAppBar(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favoriteList.length,
                itemBuilder: (BuildContext context, int index) {
                  if (favoriteList.isNotEmpty && favoriteList != null) {
                    return SearchCard(
                        trailing: GestureDetector(
                            onTap: () {
                              ref
                                  .read(listFavIdProvider.notifier)
                                  .toggle(favoriteList[index].id.toString());
                            },
                            child: const IconStar()),
                        name: favoriteList[index].name);
                  } else {
                    return const FailureStateWidget(
                        text: favoriteScreenEmptyBody);
                  }
                }),
          ),
        ],
      ),
    );
  }
}
