// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - borders
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i1;

import './app.border_widths.dart' as _i2;
import './app.colors.dart' as _i3;

abstract final class AppBorders {
  static _i1.Border all(
    _i2.AppBorderWidth width, {
    _i3.AppColor color = _i3.AppColor.black,
  }) => _i1.Border.all(width: width.width, color: color.color);

  static _i1.Border symmetric({
    _i2.AppBorderWidth? horizontal,
    _i2.AppBorderWidth? vertical,
    _i3.AppColor color = _i3.AppColor.black,
  }) => _i1.Border.symmetric(
    horizontal: horizontal != null
        ? _i1.BorderSide(width: horizontal.width, color: color.color)
        : _i1.BorderSide.none,
    vertical: vertical != null
        ? _i1.BorderSide(width: vertical.width, color: color.color)
        : _i1.BorderSide.none,
  );

  static _i1.Border only({
    _i2.AppBorderWidth? top,
    _i2.AppBorderWidth? right,
    _i2.AppBorderWidth? bottom,
    _i2.AppBorderWidth? left,
    _i3.AppColor color = _i3.AppColor.black,
  }) => _i1.Border(
    top: top != null
        ? _i1.BorderSide(width: top.width, color: color.color)
        : _i1.BorderSide.none,
    right: right != null
        ? _i1.BorderSide(width: right.width, color: color.color)
        : _i1.BorderSide.none,
    bottom: bottom != null
        ? _i1.BorderSide(width: bottom.width, color: color.color)
        : _i1.BorderSide.none,
    left: left != null
        ? _i1.BorderSide(width: left.width, color: color.color)
        : _i1.BorderSide.none,
  );

  static _i1.Border none() => _i1.Border.fromBorderSide(_i1.BorderSide.none);
}
