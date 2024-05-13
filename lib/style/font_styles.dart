import 'package:flutter/material.dart';

import 'style.dart';

class FontStyles {
  static const TextStyle headerMain = TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static const TextStyle body = TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );

  static const TextStyle headerMainWhite = TextStyle(
    fontFamily: 'Raleway',
    color: Palette.backgroundMain,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static const TextStyle headerMainAccent = TextStyle(
    fontFamily: 'Raleway',
    color: Palette.accentPrimary,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static const TextStyle bodyPlaceHolder = TextStyle(
    fontFamily: 'Raleway',
    color: Palette.textPlaceholder,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
}
