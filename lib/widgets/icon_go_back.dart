import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../style/style.dart';


class IconGoBack extends StatelessWidget {
  const IconGoBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
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
          child: SvgPicture.asset('asset/icons/Vector2.svg'),
        ),
      ),
    );
  }
}
