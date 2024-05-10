import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../style/style.dart';


class IconNotFavoriteStar extends StatelessWidget {
  const IconNotFavoriteStar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        color: Palette.layer1,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Palette.layer1,
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          'asset/icons/Vector.svg',
          colorFilter:
              const ColorFilter.mode(Palette.textPlaceholder, BlendMode.srcIn),
        ),
      ),
    );
  }
}
