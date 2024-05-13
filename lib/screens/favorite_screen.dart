import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_task/constants.dart';
import 'package:riverpod_test_task/models/repository_model.dart';
import 'package:riverpod_test_task/providers/local_favorite_repository_provider.dart';
import 'package:riverpod_test_task/style/style.dart';
import 'package:riverpod_test_task/widgets/failure_state_widget.dart';
import 'package:riverpod_test_task/widgets/icon_star.dart';
import 'package:riverpod_test_task/widgets/leading_appbar.dart';
import 'package:riverpod_test_task/widgets/search_card.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  ConsumerState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final List<RepositoryModel> favorites =
        ref.watch(listFavoriteRepositoryProvider);

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
                itemCount: favorites.length,
                itemBuilder: (BuildContext context, int index) {
                  if (favorites.isNotEmpty) {
                    return SearchCard(
                        trailing: GestureDetector(
                            onTap: () {
                              ref
                                  .watch(
                                      listFavoriteRepositoryProvider.notifier)
                                  .remove(favorites[index]);
                            },
                            child: const IconStar()),
                        name: favorites[index].name);
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

// class FavoriteScreen extends ConsumerWidget {
//   const FavoriteScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//
//        final List<RepositoryModel> favorites = ref.read(listFavoriteRepositoryProvider);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           navigationBarFavoriteScreen,
//           style: FontStyles.headerMain,
//         ),
//         centerTitle: true,
//         automaticallyImplyLeading: true,
//         leading: const LeadingAppBar(),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//                 itemCount: favorites.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   if (favorites.isNotEmpty) {
//                     return SearchCard(
//                         trailing: GestureDetector(
//                             onTap: () {
//                               ref.watch(listFavoriteRepositoryProvider.notifier).remove(favorites[index]);
//
//                             },
//                             child: const IconStar()),
//                         name: favorites[index].name);
//                   } else {
//                     return const FailureStateWidget(
//                         text: favoriteScreenEmptyBody);
//                   }
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
