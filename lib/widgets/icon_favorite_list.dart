import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../style/style.dart';

class IconFavoriteList extends StatelessWidget {
  const IconFavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        color: Palette.accentPrimary,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Palette.accentPrimary,
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          'asset/icons/Vector.svg',
        ),
      ),
    );
  }
}
