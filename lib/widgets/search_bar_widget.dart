import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverpod_test_task/providers/repository_provider.dart';
import 'package:riverpod_test_task/providers/local_history.dart';
import 'package:riverpod_test_task/providers/request_provider.dart';
import '../constants.dart';
import '../providers/is_sent_request_provider.dart';
import '../style/style.dart';

class SearchBarWidget extends ConsumerStatefulWidget {
  final Widget trailing;

  const SearchBarWidget({super.key, this.trailing = const SizedBox.shrink()});

  @override
  ConsumerState<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends ConsumerState<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    //final request = ref.watch(requestProvider);
    TextEditingController searchController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: TextField(
        controller: searchController,
        textInputAction: TextInputAction.done,
        onEditingComplete: () {
          ref.read(requestProvider.notifier).update((state) => searchController.text);
          ref.read(localHistoryProvider.notifier).addHistory(searchController.text);
          ref.read(isSentRequest.notifier).state = true;
          ref.read(repositoryProvider);
          searchController.clear();

        },
        focusNode: focusNode,
        onSubmitted: (value) {
          focusNode.unfocus();
        },
        onTapOutside: (value) {
          focusNode.unfocus();
        },
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              'asset/icons/Search.svg',
              height: 24,
              width: 24,
            ),
          ),
          suffix: GestureDetector(
              onTap: () {
                searchController.clear();
              },
              child: widget.trailing),
          hintText: hintText,
          hintStyle: const TextStyle(color: Palette.textPlaceholder),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Palette.layer1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              width: 2,
              color: Palette.accentPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
