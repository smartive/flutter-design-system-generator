// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - spatials
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i1;

abstract final class AppSpatials {
  /// big (-30.0px)
  static const big = -30.0;

  /// small (10.0px)
  static const small = 10.0;

  /// medium (20.0px)
  static const medium = 20.0;
}

enum AppSpatial {
  /// big (-30.0px)
  big(AppSpatials.big),

  /// small (10.0px)
  small(AppSpatials.small),

  /// medium (20.0px)
  medium(AppSpatials.medium);

  const AppSpatial(this.value);

  final double value;

  int get integer => value.toInt();
  _i1.SizedBox get verticalSpacer => _i1.SizedBox(height: value);
  _i1.SizedBox get horizontalSpacer => _i1.SizedBox(width: value);
  _i1.EdgeInsets get insetsAll => _i1.EdgeInsets.all(value);
  _i1.EdgeInsets get insetsHorizontal =>
      _i1.EdgeInsets.symmetric(horizontal: value);
  _i1.EdgeInsets get insetsVertical =>
      _i1.EdgeInsets.symmetric(vertical: value);
  _i1.EdgeInsets get insetsTop => _i1.EdgeInsets.only(top: value);
  _i1.EdgeInsets get insetsBottom => _i1.EdgeInsets.only(bottom: value);
  _i1.EdgeInsets get insetsLeft => _i1.EdgeInsets.only(left: value);
  _i1.EdgeInsets get insetsRight => _i1.EdgeInsets.only(right: value);
  _i1.EdgeInsets only({
    bool left = false,
    bool top = false,
    bool right = false,
    bool bottom = false,
  }) =>
      _i1.EdgeInsets.only(
        left: left ? value : 0,
        right: right ? value : 0,
        top: top ? value : 0,
        bottom: bottom ? value : 0,
      );
  _i1.EdgeInsets combine({
    AppSpatial? left,
    AppSpatial? top,
    AppSpatial? right,
    AppSpatial? bottom,
  }) =>
      insetsAll.copyWith(
        left: left?.value,
        top: top?.value,
        right: right?.value,
        bottom: bottom?.value,
      );
}
