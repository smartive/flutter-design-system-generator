part of 'generators_test.dart';

const _emptyDesignSystem = '{}';

class _TestCase {
  final String name;
  final String input;
  final String output;

  const _TestCase(this.name, this.input, this.output);
}

const _radiusTestCases = [
  _TestCase('default radii', _emptyDesignSystem,
      '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Border Radii
// **************************************************************************

import 'package:flutter/widgets.dart';

final class AppBorderRadii {
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
'''),
  _TestCase('valid radii', '''{
  "borderRadius": {
    "first": 15,
    "second": 30
  }
}''', '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Border Radii
// **************************************************************************

import 'package:flutter/widgets.dart';

final class AppBorderRadii {
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
'''),
  _TestCase('invalid radii names', '''{
  "borderRadius": {
    "1": 15,
    "2": 30
  }
}''', '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Border Radii
// **************************************************************************

import 'package:flutter/widgets.dart';

final class AppBorderRadii {
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
'''),
  _TestCase('disabled', '{"borderRadius": false}', ''),
];

const _colorTestCases = [
  _TestCase('default colors', _emptyDesignSystem,
      '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Colors
// **************************************************************************

import 'dart:ui';

final class AppColors {
  AppColors._();

  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const transparent = Color(0x00000000);
}

enum AppColor {
  black(AppColors.black),
  white(AppColors.white),
  transparent(AppColors.transparent);

  const AppColor(this.color);

  final Color color;

  Color withOpacity(double opacity) => color.withOpacity(opacity);

  static AppColor fromColor(Color color, [AppColor? orElse]) =>
      AppColor.values.firstWhere((e) => e.color == color,
          orElse: orElse == null ? null : () => orElse);
}
'''),
  _TestCase('valid colors', '''{
  "colors": {
    "pink": "#FF00FF",
    "blue": "#0000FF",
    "green": "#00FF00",
    "yellow": "#FFFF00"
  }
}''', '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Colors
// **************************************************************************

import 'dart:ui';

final class AppColors {
  AppColors._();

  static const blue = Color(0xFF0000FF);
  static const green = Color(0xFF00FF00);
  static const pink = Color(0xFFFF00FF);
  static const yellow = Color(0xFFFFFF00);
}

enum AppColor {
  blue(AppColors.blue),
  green(AppColors.green),
  pink(AppColors.pink),
  yellow(AppColors.yellow);

  const AppColor(this.color);

  final Color color;

  Color withOpacity(double opacity) => color.withOpacity(opacity);

  static AppColor fromColor(Color color, [AppColor? orElse]) =>
      AppColor.values.firstWhere((e) => e.color == color,
          orElse: orElse == null ? null : () => orElse);
}
'''),
  _TestCase('valid namespaced colors', '''{
  "colors": {
    "pink": {
      "base": "#FFC0CB",
      "light": "#FFB6C1",
      "dark": {
        "50": "#FFC0CB",
        "100": "#FFB6C1"
      },
      "DEFAULT": "#000000"
    }
  }
}''', '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Colors
// **************************************************************************

import 'dart:ui';

final class AppColors {
  AppColors._();

  static const dark100 = Color(0xFFFFB6C1);
  static const dark50 = Color(0xFFFFC0CB);
  static const pink = Color(0xFF000000);
  static const pinkbase = Color(0xFFFFC0CB);
  static const pinklight = Color(0xFFFFB6C1);
}

enum AppColor {
  dark100(AppColors.dark100),
  dark50(AppColors.dark50),
  pink(AppColors.pink),
  pinkbase(AppColors.pinkbase),
  pinklight(AppColors.pinklight);

  const AppColor(this.color);

  final Color color;

  Color withOpacity(double opacity) => color.withOpacity(opacity);

  static AppColor fromColor(Color color, [AppColor? orElse]) =>
      AppColor.values.firstWhere((e) => e.color == color,
          orElse: orElse == null ? null : () => orElse);
}
'''),
  _TestCase('invalid named colors', '''{
  "colors": {
    "foo": "#FF00FF",
    "123": "#FFB6C1",
    "": "#FFB6C1"
  }
}''', '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Colors
// **************************************************************************

import 'dart:ui';

final class AppColors {
  AppColors._();

  static const color = Color(0xFFFFB6C1);
  static const color123 = Color(0xFFFFB6C1);
  static const foo = Color(0xFFFF00FF);
}

enum AppColor {
  color(AppColors.color),
  color123(AppColors.color123),
  foo(AppColors.foo);

  const AppColor(this.color);

  final Color color;

  Color withOpacity(double opacity) => color.withOpacity(opacity);

  static AppColor fromColor(Color color, [AppColor? orElse]) =>
      AppColor.values.firstWhere((e) => e.color == color,
          orElse: orElse == null ? null : () => orElse);
}
'''),
  _TestCase('invalid color values', '''{
  "colors": {
    "foo": "bar",
    "wrong": "#ffff"
  }
}''', '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Colors
// **************************************************************************

import 'dart:ui';

final class AppColors {
  AppColors._();

  // foo contains a non-valid 6 or 8 char hex string ("bar").
  static const foo = Color(0x00000000);
  // wrong contains a non-valid 6 or 8 char hex string ("#ffff").
  static const wrong = Color(0x00000000);
}

enum AppColor {
  foo(AppColors.foo),
  wrong(AppColors.wrong);

  const AppColor(this.color);

  final Color color;

  Color withOpacity(double opacity) => color.withOpacity(opacity);

  static AppColor fromColor(Color color, [AppColor? orElse]) =>
      AppColor.values.firstWhere((e) => e.color == color,
          orElse: orElse == null ? null : () => orElse);
}
'''),
  _TestCase('colors with alpha channel', '''{
  "colors": {
    "withAlpha": "#aabbccdd",
    "withoutAlpha": "#aabbcc"
  }
}''', '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Colors
// **************************************************************************

import 'dart:ui';

final class AppColors {
  AppColors._();

  static const withAlpha = Color(0xddaabbcc);
  static const withoutAlpha = Color(0xFFaabbcc);
}

enum AppColor {
  withAlpha(AppColors.withAlpha),
  withoutAlpha(AppColors.withoutAlpha);

  const AppColor(this.color);

  final Color color;

  Color withOpacity(double opacity) => color.withOpacity(opacity);

  static AppColor fromColor(Color color, [AppColor? orElse]) =>
      AppColor.values.firstWhere((e) => e.color == color,
          orElse: orElse == null ? null : () => orElse);
}
'''),
  _TestCase('colors with tripple', '''{
  "colors": {
    "black": "#000",
    "mix": "#abc",
    "white": "#fff"
  }
}''', '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Colors
// **************************************************************************

import 'dart:ui';

final class AppColors {
  AppColors._();

  static const black = Color(0xFF000000);
  static const mix = Color(0xFFaabbcc);
  static const white = Color(0xFFffffff);
}

enum AppColor {
  black(AppColors.black),
  mix(AppColors.mix),
  white(AppColors.white);

  const AppColor(this.color);

  final Color color;

  Color withOpacity(double opacity) => color.withOpacity(opacity);

  static AppColor fromColor(Color color, [AppColor? orElse]) =>
      AppColor.values.firstWhere((e) => e.color == color,
          orElse: orElse == null ? null : () => orElse);
}
'''),
  _TestCase('disabled', '{"colors": false}', ''),
];

const _screenTestCases = [
  _TestCase('default screens', _emptyDesignSystem,
      '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Screens & Breakpoints
// **************************************************************************

import 'package:flutter/widgets.dart';

final class AppBreakpoints {
  AppBreakpoints._();

  /// sm (640.0px) - media query width >= 640.0px
  static const sm = 640.0;
  /// md (768.0px) - media query width >= 768.0px
  static const md = 768.0;
  /// lg (1024.0px) - media query width >= 1024.0px
  static const lg = 1024.0;
  /// xl (1280.0px) - media query width >= 1280.0px
  static const xl = 1280.0;
}

enum AppBreakpoint {
  /// sm (640.0px)
  sm(AppBreakpoints.sm),
  /// md (768.0px)
  md(AppBreakpoints.md),
  /// lg (1024.0px)
  lg(AppBreakpoints.lg),
  /// xl (1280.0px)
  xl(AppBreakpoints.xl);

  const AppBreakpoint(this.width);

  final double width;

  int get integerWidth => width.toInt();
}

/// Return a specific value based on the current window/view size.
/// If a [context] is provided, `View.of(context)` determines the
/// size, otherwise the platformDispatcher is used.
///
/// Returns the biggest possible value of the defined breakpoints.
/// If the screen is smaller than the smallest breakpoint, [defaultValue]
/// is returned.
///
/// Breakpoints:
/// - sm (640.0px)
/// - md (768.0px)
/// - lg (1024.0px)
/// - xl (1280.0px)
T responsiveValue<T>(
  T defaultValue, {
  BuildContext? context,
  T? sm,
  T? md,
  T? lg,
  T? xl,
}) {
  final width = context != null
      ? View.of(context).physicalSize.width
      : WidgetsBinding
          .instance.platformDispatcher.views.first.physicalSize.width;
  final values = {
    AppBreakpoints.xl: xl,
    AppBreakpoints.lg: lg,
    AppBreakpoints.md: md,
    AppBreakpoints.sm: sm,
  };
  return values.entries
      .skipWhile((e) => e.key > width)
      .map((e) => e.value)
      .firstWhere((e) => e != null, orElse: () => defaultValue) as T;
}
'''),
  _TestCase('valid screens', '''
{
  "screens": {
    "tablet": 200,
    "desktop": 440
  }
}
''', '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Screens & Breakpoints
// **************************************************************************

import 'package:flutter/widgets.dart';

final class AppBreakpoints {
  AppBreakpoints._();

  /// tablet (200.0px) - media query width >= 200.0px
  static const tablet = 200.0;
  /// desktop (440.0px) - media query width >= 440.0px
  static const desktop = 440.0;
}

enum AppBreakpoint {
  /// tablet (200.0px)
  tablet(AppBreakpoints.tablet),
  /// desktop (440.0px)
  desktop(AppBreakpoints.desktop);

  const AppBreakpoint(this.width);

  final double width;

  int get integerWidth => width.toInt();
}

/// Return a specific value based on the current window/view size.
/// If a [context] is provided, `View.of(context)` determines the
/// size, otherwise the platformDispatcher is used.
///
/// Returns the biggest possible value of the defined breakpoints.
/// If the screen is smaller than the smallest breakpoint, [defaultValue]
/// is returned.
///
/// Breakpoints:
/// - tablet (200.0px)
/// - desktop (440.0px)
T responsiveValue<T>(
  T defaultValue, {
  BuildContext? context,
  T? tablet,
  T? desktop,
}) {
  final width = context != null
      ? View.of(context).physicalSize.width
      : WidgetsBinding
          .instance.platformDispatcher.views.first.physicalSize.width;
  final values = {
    AppBreakpoints.desktop: desktop,
    AppBreakpoints.tablet: tablet,
  };
  return values.entries
      .skipWhile((e) => e.key > width)
      .map((e) => e.value)
      .firstWhere((e) => e != null, orElse: () => defaultValue) as T;
}
'''),
  _TestCase('invalid screens', '''
{
  "screens": {
    "1": 200,
    "2": 440
  }
}
''', '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Screens & Breakpoints
// **************************************************************************

import 'package:flutter/widgets.dart';

final class AppBreakpoints {
  AppBreakpoints._();

  /// screen1 (200.0px) - media query width >= 200.0px
  static const screen1 = 200.0;
  /// screen2 (440.0px) - media query width >= 440.0px
  static const screen2 = 440.0;
}

enum AppBreakpoint {
  /// screen1 (200.0px)
  screen1(AppBreakpoints.screen1),
  /// screen2 (440.0px)
  screen2(AppBreakpoints.screen2);

  const AppBreakpoint(this.width);

  final double width;

  int get integerWidth => width.toInt();
}

/// Return a specific value based on the current window/view size.
/// If a [context] is provided, `View.of(context)` determines the
/// size, otherwise the platformDispatcher is used.
///
/// Returns the biggest possible value of the defined breakpoints.
/// If the screen is smaller than the smallest breakpoint, [defaultValue]
/// is returned.
///
/// Breakpoints:
/// - screen1 (200.0px)
/// - screen2 (440.0px)
T responsiveValue<T>(
  T defaultValue, {
  BuildContext? context,
  T? screen1,
  T? screen2,
}) {
  final width = context != null
      ? View.of(context).physicalSize.width
      : WidgetsBinding
          .instance.platformDispatcher.views.first.physicalSize.width;
  final values = {
    AppBreakpoints.screen2: screen2,
    AppBreakpoints.screen1: screen1,
  };
  return values.entries
      .skipWhile((e) => e.key > width)
      .map((e) => e.value)
      .firstWhere((e) => e != null, orElse: () => defaultValue) as T;
}
'''),
  _TestCase('disabled', '{"screens": false}', ''),
];

const _spatialTestCases = [
  _TestCase('default spatials', _emptyDesignSystem,
      '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Spatials
// **************************************************************************

import 'package:flutter/widgets.dart';

final class AppSpatials {
  AppSpatials._();

  /// spatial0 (0.0px)
  static const spatial0 = 0.0;
  /// spatial1 (1.0px)
  static const spatial1 = 1.0;
  /// spatial2 (2.0px)
  static const spatial2 = 2.0;
  /// spatial4 (4.0px)
  static const spatial4 = 4.0;
  /// spatial8 (8.0px)
  static const spatial8 = 8.0;
  /// spatial10 (10.0px)
  static const spatial10 = 10.0;
  /// spatial12 (12.0px)
  static const spatial12 = 12.0;
  /// spatial14 (14.0px)
  static const spatial14 = 14.0;
  /// spatial16 (16.0px)
  static const spatial16 = 16.0;
  /// spatial20 (20.0px)
  static const spatial20 = 20.0;
  /// spatial24 (24.0px)
  static const spatial24 = 24.0;
  /// spatial28 (28.0px)
  static const spatial28 = 28.0;
  /// spatial32 (32.0px)
  static const spatial32 = 32.0;
  /// spatial36 (36.0px)
  static const spatial36 = 36.0;
  /// spatial40 (40.0px)
  static const spatial40 = 40.0;
  /// spatial48 (48.0px)
  static const spatial48 = 48.0;
  /// spatial56 (56.0px)
  static const spatial56 = 56.0;
  /// spatial64 (64.0px)
  static const spatial64 = 64.0;
  /// spatial72 (72.0px)
  static const spatial72 = 72.0;
  /// spatial80 (80.0px)
  static const spatial80 = 80.0;
  /// spatial96 (96.0px)
  static const spatial96 = 96.0;
  /// spatial112 (112.0px)
  static const spatial112 = 112.0;
  /// spatial128 (128.0px)
  static const spatial128 = 128.0;
  /// spatial144 (144.0px)
  static const spatial144 = 144.0;
  /// spatial160 (160.0px)
  static const spatial160 = 160.0;
  /// spatial176 (176.0px)
  static const spatial176 = 176.0;
  /// spatial192 (192.0px)
  static const spatial192 = 192.0;
  /// spatial208 (208.0px)
  static const spatial208 = 208.0;
  /// spatial224 (224.0px)
  static const spatial224 = 224.0;
  /// spatial240 (240.0px)
  static const spatial240 = 240.0;
  /// spatial256 (256.0px)
  static const spatial256 = 256.0;
  /// spatial288 (288.0px)
  static const spatial288 = 288.0;
  /// spatial320 (320.0px)
  static const spatial320 = 320.0;
  /// spatial384 (384.0px)
  static const spatial384 = 384.0;
  /// spatial448 (448.0px)
  static const spatial448 = 448.0;
  /// spatial512 (512.0px)
  static const spatial512 = 512.0;
}

enum AppSpatial {
  /// spatial0 (0.0px)
  spatial0(AppSpatials.spatial0),
  /// spatial1 (1.0px)
  spatial1(AppSpatials.spatial1),
  /// spatial2 (2.0px)
  spatial2(AppSpatials.spatial2),
  /// spatial4 (4.0px)
  spatial4(AppSpatials.spatial4),
  /// spatial8 (8.0px)
  spatial8(AppSpatials.spatial8),
  /// spatial10 (10.0px)
  spatial10(AppSpatials.spatial10),
  /// spatial12 (12.0px)
  spatial12(AppSpatials.spatial12),
  /// spatial14 (14.0px)
  spatial14(AppSpatials.spatial14),
  /// spatial16 (16.0px)
  spatial16(AppSpatials.spatial16),
  /// spatial20 (20.0px)
  spatial20(AppSpatials.spatial20),
  /// spatial24 (24.0px)
  spatial24(AppSpatials.spatial24),
  /// spatial28 (28.0px)
  spatial28(AppSpatials.spatial28),
  /// spatial32 (32.0px)
  spatial32(AppSpatials.spatial32),
  /// spatial36 (36.0px)
  spatial36(AppSpatials.spatial36),
  /// spatial40 (40.0px)
  spatial40(AppSpatials.spatial40),
  /// spatial48 (48.0px)
  spatial48(AppSpatials.spatial48),
  /// spatial56 (56.0px)
  spatial56(AppSpatials.spatial56),
  /// spatial64 (64.0px)
  spatial64(AppSpatials.spatial64),
  /// spatial72 (72.0px)
  spatial72(AppSpatials.spatial72),
  /// spatial80 (80.0px)
  spatial80(AppSpatials.spatial80),
  /// spatial96 (96.0px)
  spatial96(AppSpatials.spatial96),
  /// spatial112 (112.0px)
  spatial112(AppSpatials.spatial112),
  /// spatial128 (128.0px)
  spatial128(AppSpatials.spatial128),
  /// spatial144 (144.0px)
  spatial144(AppSpatials.spatial144),
  /// spatial160 (160.0px)
  spatial160(AppSpatials.spatial160),
  /// spatial176 (176.0px)
  spatial176(AppSpatials.spatial176),
  /// spatial192 (192.0px)
  spatial192(AppSpatials.spatial192),
  /// spatial208 (208.0px)
  spatial208(AppSpatials.spatial208),
  /// spatial224 (224.0px)
  spatial224(AppSpatials.spatial224),
  /// spatial240 (240.0px)
  spatial240(AppSpatials.spatial240),
  /// spatial256 (256.0px)
  spatial256(AppSpatials.spatial256),
  /// spatial288 (288.0px)
  spatial288(AppSpatials.spatial288),
  /// spatial320 (320.0px)
  spatial320(AppSpatials.spatial320),
  /// spatial384 (384.0px)
  spatial384(AppSpatials.spatial384),
  /// spatial448 (448.0px)
  spatial448(AppSpatials.spatial448),
  /// spatial512 (512.0px)
  spatial512(AppSpatials.spatial512);

  const AppSpatial(this.value);

  final double value;

  int get integer => value.toInt();

  SizedBox get verticalSpacer => SizedBox(height: value);

  SizedBox get horizontalSpacer => SizedBox(width: value);

  EdgeInsets get insetsAll => EdgeInsets.all(value);

  EdgeInsets get insetsHorizontal => EdgeInsets.symmetric(horizontal: value);

  EdgeInsets get insetsVertical => EdgeInsets.symmetric(vertical: value);

  EdgeInsets get insetsTop => EdgeInsets.only(top: value);

  EdgeInsets get insetsBottom => EdgeInsets.only(bottom: value);

  EdgeInsets get insetsLeft => EdgeInsets.only(left: value);

  EdgeInsets get insetsRight => EdgeInsets.only(right: value);
}
'''),
  _TestCase('valid spatials', '''
{
  "spacings": {
    "a": 2,
    "b": 4
  }
}
''', '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Spatials
// **************************************************************************

import 'package:flutter/widgets.dart';

final class AppSpatials {
  AppSpatials._();

  /// a (2.0px)
  static const a = 2.0;
  /// b (4.0px)
  static const b = 4.0;
}

enum AppSpatial {
  /// a (2.0px)
  a(AppSpatials.a),
  /// b (4.0px)
  b(AppSpatials.b);

  const AppSpatial(this.value);

  final double value;

  int get integer => value.toInt();

  SizedBox get verticalSpacer => SizedBox(height: value);

  SizedBox get horizontalSpacer => SizedBox(width: value);

  EdgeInsets get insetsAll => EdgeInsets.all(value);

  EdgeInsets get insetsHorizontal => EdgeInsets.symmetric(horizontal: value);

  EdgeInsets get insetsVertical => EdgeInsets.symmetric(vertical: value);

  EdgeInsets get insetsTop => EdgeInsets.only(top: value);

  EdgeInsets get insetsBottom => EdgeInsets.only(bottom: value);

  EdgeInsets get insetsLeft => EdgeInsets.only(left: value);

  EdgeInsets get insetsRight => EdgeInsets.only(right: value);
}
'''),
  _TestCase('invalid spatials', '''
{
  "spacings": {
    "1": 2,
    "2": 4
  }
}
''', '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Spatials
// **************************************************************************

import 'package:flutter/widgets.dart';

final class AppSpatials {
  AppSpatials._();

  /// spatial1 (2.0px)
  static const spatial1 = 2.0;
  /// spatial2 (4.0px)
  static const spatial2 = 4.0;
}

enum AppSpatial {
  /// spatial1 (2.0px)
  spatial1(AppSpatials.spatial1),
  /// spatial2 (4.0px)
  spatial2(AppSpatials.spatial2);

  const AppSpatial(this.value);

  final double value;

  int get integer => value.toInt();

  SizedBox get verticalSpacer => SizedBox(height: value);

  SizedBox get horizontalSpacer => SizedBox(width: value);

  EdgeInsets get insetsAll => EdgeInsets.all(value);

  EdgeInsets get insetsHorizontal => EdgeInsets.symmetric(horizontal: value);

  EdgeInsets get insetsVertical => EdgeInsets.symmetric(vertical: value);

  EdgeInsets get insetsTop => EdgeInsets.only(top: value);

  EdgeInsets get insetsBottom => EdgeInsets.only(bottom: value);

  EdgeInsets get insetsLeft => EdgeInsets.only(left: value);

  EdgeInsets get insetsRight => EdgeInsets.only(right: value);
}
'''),
  _TestCase('disabled', '{"spacings": false}', ''),
];
