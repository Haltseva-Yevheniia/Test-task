
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_task/providers/is_sent_request_provider.dart';
import 'package:riverpod_test_task/providers/local_history.dart';
import 'package:riverpod_test_task/widgets/search_history_widget.dart';

import '../constants.dart';
import '../style/style.dart';
import '../widgets/project_widgets.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/search_data_widget.dart';
import 'favorite_screen.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  

  @override
  Widget build(BuildContext context) {

final isSent = ref.watch(isSentRequest);
  // ref.read(localHistoryProvider.notifier).addHistory(request)

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            navigationBarSearchScreen,
            style: FontStyles.headerMain,
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FavoriteScreen()));
                  },
                  child: const IconFavoriteList()),
            ),
          ],
        ),
        body:
        Column(
        children: [
          const Divider(height: 1, thickness: 1, color: Palette.layer1),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SearchBarWidget(),
                ),
                Text(
                  searchHistory,
                  textAlign: TextAlign.left,
                  style: FontStyles.headerMainAccent,
                ),
              ],
            ),
          ),
          Expanded(
            child: isSent ? const SearchDataWidget() : const SearchHistoryWidget(),
          )
        ],),
      );
    }

}

