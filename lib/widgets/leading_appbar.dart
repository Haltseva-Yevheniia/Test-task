import 'package:flutter/material.dart';

import '../../../widgets/project_widgets.dart';

class LeadingAppBar extends StatelessWidget {
  const LeadingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 9),
      child: IconGoBack(),
    );
  }
}
