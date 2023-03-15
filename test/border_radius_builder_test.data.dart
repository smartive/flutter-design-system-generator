part of 'border_radius_builder_test.dart';

const _inputEmptyDesignSystem = <String, String>{
  'mylib|lib/design-system.json': '''
{
}
'''
};

const _outputDefaultRadii = <String, String>{
  'mylib|lib/ui/identity/border_radii.g.dart':
      '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Border Radii
// **************************************************************************

import 'package:flutter/widgets.dart';

class AppBorderRadii {
  AppBorderRadii._();

  /// none (0.0px)
  static const none = 0.0;
  /// small (2.0px)
  static const small = 2.0;
  /// rounded (4.0px)
  static const rounded = 4.0;
  /// medium (6.0px)
  static const medium = 6.0;
  /// large (8.0px)
  static const large = 8.0;
  /// full (9999.0px)
  static const full = 9999.0;
}

enum AppBorderRadius {
  /// none (0.0px)
  none(AppBorderRadii.none),
  /// small (2.0px)
  small(AppBorderRadii.small),
  /// rounded (4.0px)
  rounded(AppBorderRadii.rounded),
  /// medium (6.0px)
  medium(AppBorderRadii.medium),
  /// large (8.0px)
  large(AppBorderRadii.large),
  /// full (9999.0px)
  full(AppBorderRadii.full);

  const AppBorderRadius(this.radius);

  final double radius;

  BorderRadius get all =>
      only(topLeft: true, topRight: true, bottomLeft: true, bottomRight: true);

  BorderRadius get bottom => only(bottomLeft: true, bottomRight: true);

  BorderRadius get left => only(topLeft: true, bottomLeft: true);

  BorderRadius get right => only(topRight: true, bottomRight: true);

  BorderRadius get top => only(topLeft: true, topRight: true);

  BorderRadius only(
          {bool topLeft = false,
          bool topRight = false,
          bool bottomLeft = false,
          bool bottomRight = false}) =>
      BorderRadius.only(
        topLeft: topLeft ? Radius.circular(radius) : Radius.zero,
        topRight: topRight ? Radius.circular(radius) : Radius.zero,
        bottomLeft: bottomLeft ? Radius.circular(radius) : Radius.zero,
        bottomRight: bottomRight ? Radius.circular(radius) : Radius.zero,
      );
}
'''
};

const _inputValidRadii = <String, String>{
  'mylib|lib/design-system.json': '''
{
  "borderRadius": {
    "first": 15,
    "second": 30
  }
}
'''
};

const _outputValidRadii = <String, String>{
  'mylib|lib/ui/identity/border_radii.g.dart':
      '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Border Radii
// **************************************************************************

import 'package:flutter/widgets.dart';

class AppBorderRadii {
  AppBorderRadii._();

  /// first (15.0px)
  static const first = 15.0;
  /// second (30.0px)
  static const second = 30.0;
}

enum AppBorderRadius {
  /// first (15.0px)
  first(AppBorderRadii.first),
  /// second (30.0px)
  second(AppBorderRadii.second);

  const AppBorderRadius(this.radius);

  final double radius;

  BorderRadius get all =>
      only(topLeft: true, topRight: true, bottomLeft: true, bottomRight: true);

  BorderRadius get bottom => only(bottomLeft: true, bottomRight: true);

  BorderRadius get left => only(topLeft: true, bottomLeft: true);

  BorderRadius get right => only(topRight: true, bottomRight: true);

  BorderRadius get top => only(topLeft: true, topRight: true);

  BorderRadius only(
          {bool topLeft = false,
          bool topRight = false,
          bool bottomLeft = false,
          bool bottomRight = false}) =>
      BorderRadius.only(
        topLeft: topLeft ? Radius.circular(radius) : Radius.zero,
        topRight: topRight ? Radius.circular(radius) : Radius.zero,
        bottomLeft: bottomLeft ? Radius.circular(radius) : Radius.zero,
        bottomRight: bottomRight ? Radius.circular(radius) : Radius.zero,
      );
}
'''
};

const _inputInvalidRadiiNames = <String, String>{
  'mylib|lib/design-system.json': '''
{
  "borderRadius": {
    "1": 15,
    "2": 30
  }
}
'''
};

const _outputInvalidRadiiNames = <String, String>{
  'mylib|lib/ui/identity/border_radii.g.dart':
      '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Border Radii
// **************************************************************************

import 'package:flutter/widgets.dart';

class AppBorderRadii {
  AppBorderRadii._();

  /// radius1 (15.0px)
  static const radius1 = 15.0;
  /// radius2 (30.0px)
  static const radius2 = 30.0;
}

enum AppBorderRadius {
  /// radius1 (15.0px)
  radius1(AppBorderRadii.radius1),
  /// radius2 (30.0px)
  radius2(AppBorderRadii.radius2);

  const AppBorderRadius(this.radius);

  final double radius;

  BorderRadius get all =>
      only(topLeft: true, topRight: true, bottomLeft: true, bottomRight: true);

  BorderRadius get bottom => only(bottomLeft: true, bottomRight: true);

  BorderRadius get left => only(topLeft: true, bottomLeft: true);

  BorderRadius get right => only(topRight: true, bottomRight: true);

  BorderRadius get top => only(topLeft: true, topRight: true);

  BorderRadius only(
          {bool topLeft = false,
          bool topRight = false,
          bool bottomLeft = false,
          bool bottomRight = false}) =>
      BorderRadius.only(
        topLeft: topLeft ? Radius.circular(radius) : Radius.zero,
        topRight: topRight ? Radius.circular(radius) : Radius.zero,
        bottomLeft: bottomLeft ? Radius.circular(radius) : Radius.zero,
        bottomRight: bottomRight ? Radius.circular(radius) : Radius.zero,
      );
}
'''
};
