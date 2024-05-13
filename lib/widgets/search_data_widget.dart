import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_task/providers/local_favorite_repository_provider.dart';
import 'package:riverpod_test_task/widgets/failure_widget.dart';

import '../providers/repository_provider.dart';
import '../style/style.dart';
import 'icon_not_favor_star.dart';
import 'icon_star.dart';
import 'search_card.dart';

class SearchDataWidget extends ConsumerStatefulWidget {
  const SearchDataWidget({super.key});

  @override
  ConsumerState<SearchDataWidget> createState() => _SearchDataWidgetState();
}

class _SearchDataWidgetState extends ConsumerState<SearchDataWidget> {
  final _scrollController = ScrollController();

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _onScroll() {
    if (_isBottom) {
      ref.read(repositoriesProvider.notifier).addRepositories();
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(repositoryProvider);
    ref.watch(repositoriesProvider);
    return data.when(
      data: (data) {
        if (data.isNotEmpty) {
          _scrollController.addListener(() {
            _onScroll();
          });
          //TODO when scroll to down part of page
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final favorites = ref.watch(listFavoriteRepositoryProvider);
                  final isFavorite =
                      favorites.any((repos) => repos.id == data[index].id);
                  return SearchCard(
                    name: data[index].name,
                    trailing: GestureDetector(
                        onTap: () {
                          ref
                              .read(listFavoriteRepositoryProvider.notifier)
                              .toggle(data[index]);
                        },
                        child: isFavorite
                            ? const IconStar()
                            : const IconNotFavoriteStar()),
                  );
                },
              );
            },
          );
        } else {
          return const SearchScreenFailureWidget();
        }
      },
      error: (error, stackTrace) {
        return Center(child: Text(error.toString()));
      },
      loading: () {
        return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),
              Center(
                child: CupertinoActivityIndicator(
                  radius: 22,
                  color: Palette.spinner,
                ),
              ),
            ]);
      },
    );
  }
}
