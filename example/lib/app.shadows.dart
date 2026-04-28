// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - shadows
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i1;

import './app.colors.dart' as _i2;

abstract final class AppShadows {
  /// large (blur: 12.0px, spread: -2.0px, offset: 0.0/8.0)
  static _i1.BoxShadow large({_i2.AppColor color = _i2.AppColor.black}) =>
      AppShadow.large.boxShadow(color: color);

  /// small (blur: 4.0px, spread: 0.0px, offset: 0.0/2.0)
  static _i1.BoxShadow small({_i2.AppColor color = _i2.AppColor.black}) =>
      AppShadow.small.boxShadow(color: color);
}

enum AppShadow {
  /// large (blur: 12.0px, spread: -2.0px, offset: 0.0/8.0)
  large(12.0, -2.0, _i1.Offset(0.0, 8.0)),

  /// small (blur: 4.0px, spread: 0.0px, offset: 0.0/2.0)
  small(4.0, 0.0, _i1.Offset(0.0, 2.0));

  const AppShadow(this.blurRadius, this.spreadRadius, this.offset);

  final double blurRadius;

  final double spreadRadius;

  final _i1.Offset offset;

  _i1.BoxShadow boxShadow({_i2.AppColor color = _i2.AppColor.black}) =>
      _i1.BoxShadow(
        color: color.color,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
        offset: offset,
      );

  List<_i1.BoxShadow> asList({_i2.AppColor color = _i2.AppColor.black}) => [
    boxShadow(color: color),
  ];
}
