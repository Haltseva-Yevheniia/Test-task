import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../style/style.dart';

class SearchScreenFailureWidget extends StatelessWidget {
  const SearchScreenFailureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        emptySearchResultBody,
        style: FontStyles.bodyPlaceHolder,
        textAlign: TextAlign.center,
      ),
    );
  }
}
