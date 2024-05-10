import 'package:flutter/material.dart';

import '../../../style/style.dart';
import '../../../widgets/project_widgets.dart';

class FailureStateWidget extends StatelessWidget {
  final String text;

  const FailureStateWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        dividerAppBar,
        Expanded(
            child: Center(
          child: Text(
            text,
            style: FontStyles.bodyPlaceHolder,
            textAlign: TextAlign.center,
          ),
        )),
      ],
    );
  }
}
