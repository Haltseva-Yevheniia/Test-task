import 'package:flutter/cupertino.dart';

import '../../../widgets/project_widgets.dart';

class FavoriteScreenLoadingWidget extends StatelessWidget {
  const FavoriteScreenLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        dividerAppBar,
        const SizedBox(
          height: 24,
        ),
        const Center(child: CupertinoActivityIndicator()),
      ],
    );
  }
}
