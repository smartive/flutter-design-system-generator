// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - radii
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i1;

abstract final class AppBorderRadii {
  /// normal (8.0px)
  static const normal = 8.0;

  /// full (9999.0px)
  static const full = 9999.0;
}

enum AppBorderRadius {
  /// normal (8.0px)
  normal(AppBorderRadii.normal),

  /// full (9999.0px)
  full(AppBorderRadii.full);

  const AppBorderRadius(this.radius);

  final double radius;

  _i1.Radius get asRadius => _i1.Radius.circular(radius);
  _i1.BorderRadius get all =>
      only(topLeft: true, topRight: true, bottomLeft: true, bottomRight: true);
  _i1.BorderRadius get bottom => only(bottomLeft: true, bottomRight: true);
  _i1.BorderRadius get left => only(topLeft: true, bottomLeft: true);
  _i1.BorderRadius get right => only(topRight: true, bottomRight: true);
  _i1.BorderRadius get top => only(topLeft: true, topRight: true);
  _i1.BorderRadius only({
    bool topLeft = false,
    bool topRight = false,
    bool bottomLeft = false,
    bool bottomRight = false,
  }) => _i1.BorderRadius.only(
    topLeft: topLeft ? asRadius : _i1.Radius.zero,
    topRight: topRight ? asRadius : _i1.Radius.zero,
    bottomLeft: bottomLeft ? asRadius : _i1.Radius.zero,
    bottomRight: bottomRight ? asRadius : _i1.Radius.zero,
  );
  _i1.BorderRadius combine({
    AppBorderRadius? topLeft,
    AppBorderRadius? topRight,
    AppBorderRadius? bottomLeft,
    AppBorderRadius? bottomRight,
  }) => all.copyWith(
    topLeft: topLeft?.asRadius,
    topRight: topRight?.asRadius,
    bottomLeft: bottomLeft?.asRadius,
    bottomRight: bottomRight?.asRadius,
  );
}
