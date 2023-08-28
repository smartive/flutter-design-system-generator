// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - typography
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i1;

abstract final class AppTypographies {
  /// Text Style Definition display1
  static const display1 = _i1.TextStyle(
    fontFamily: 'Arial',
    fontWeight: null,
    fontSize: null,
    height: null,
    letterSpacing: null,
    wordSpacing: null,
  );

  /// Text Style Definition root
  static const root = _i1.TextStyle(
    fontFamily: 'Arial',
    fontWeight: _i1.FontWeight.w400,
    fontSize: 16.0,
    height: 1.0,
    letterSpacing: 1.2,
    wordSpacing: 2.2,
  );
}

enum AppTypography {
  /// display1
  display1(AppTypographies.display1),

  /// root
  root(AppTypographies.root);

  const AppTypography(this.textStyle);

  final _i1.TextStyle textStyle;
}
