import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_task/constants.dart';

import '../providers/local_history.dart';
import '../style/style.dart';
import 'search_card.dart';

class SearchHistoryWidget extends ConsumerWidget {
  const SearchHistoryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(localHistoryProvider);
    if (history.isEmpty) {
      return const Center(
        child: Text(
          emptyHistory,
          style: FontStyles.bodyPlaceHolder,
          textAlign: TextAlign.center,
        ),
      );
    }
    return ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          return SearchCard(
            name: history[index],
          );
        });
  }
}
