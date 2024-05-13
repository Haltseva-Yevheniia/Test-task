import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_task/providers/local_favorite_repository_provider.dart';

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

  // void _onScroll (String name) {
  //   if (_isBottom) {context.read<SearchScreenBloc>().add(FetchReposEvent(name: name));}
  // }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(repositoryProvider);
//ref.watch(listFavoriteRepositoryProvider);

    return data.when(
      data: (data) {
        // _scrollController.addListener(() {_onScroll(state.requestName); });
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
