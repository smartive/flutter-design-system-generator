part of 'color_builder_test.dart';

const _inputEmptyDesignSystem = <String, String>{
  'mylib|lib/design-system.json': '''
{
}
'''
};

const _outputDefaultColors = <String, String>{
  'mylib|lib/ui/identity/colors.g.dart':
      '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Colors
// **************************************************************************

import 'dart:ui';

class AppColors {
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
'''
};

const _inputValidColors = <String, String>{
  'mylib|lib/design-system.json':
      '''
{
  "colors": {
    "pink": "#FF00FF",
    "blue": "#0000FF",
    "green": "#00FF00",
    "yellow": "#FFFF00"
  }
}
'''
};

const _outputValidColors = <String, String>{
  'mylib|lib/ui/identity/colors.g.dart':
      '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Colors
// **************************************************************************

import 'dart:ui';

class AppColors {
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
'''
};

const _inputNamespacedColors = <String, String>{
  'mylib|lib/design-system.json':
      '''
{
  "colors": {
    "pink": {
      "base": "#FFC0CB",
      "light": "#FFB6C1",
      "dark": "#FFB6C1"
    }
  }
}
'''
};

const _outputNamespacedColors = <String, String>{
  'mylib|lib/ui/identity/colors.g.dart':
      '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Colors
// **************************************************************************

import 'dart:ui';

class AppColors {
  AppColors._();

  static const pinkbase = Color(0xFFFFC0CB);
  static const pinkdark = Color(0xFFFFB6C1);
  static const pinklight = Color(0xFFFFB6C1);
}

enum AppColor {
  pinkbase(AppColors.pinkbase),
  pinkdark(AppColors.pinkdark),
  pinklight(AppColors.pinklight);

  const AppColor(this.color);

  final Color color;

  Color withOpacity(double opacity) => color.withOpacity(opacity);

  static AppColor fromColor(Color color, [AppColor? orElse]) =>
      AppColor.values.firstWhere((e) => e.color == color,
          orElse: orElse == null ? null : () => orElse);
}
'''
};

const _inputNamespacedColorsWithDefault = <String, String>{
  'mylib|lib/design-system.json':
      '''
{
  "colors": {
    "pink": {
      "DEFAULT": "#FF00FF",
      "light": "#FFB6C1",
      "dark": "#FFB6C1"
    }
  }
}
'''
};

const _outputNamespacedColorsWithDefault = <String, String>{
  'mylib|lib/ui/identity/colors.g.dart':
      '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Colors
// **************************************************************************

import 'dart:ui';

class AppColors {
  AppColors._();

  static const pink = Color(0xFFFF00FF);
  static const pinkdark = Color(0xFFFFB6C1);
  static const pinklight = Color(0xFFFFB6C1);
}

enum AppColor {
  pink(AppColors.pink),
  pinkdark(AppColors.pinkdark),
  pinklight(AppColors.pinklight);

  const AppColor(this.color);

  final Color color;

  Color withOpacity(double opacity) => color.withOpacity(opacity);

  static AppColor fromColor(Color color, [AppColor? orElse]) =>
      AppColor.values.firstWhere((e) => e.color == color,
          orElse: orElse == null ? null : () => orElse);
}
'''
};

const _inputInvalidColorNames = <String, String>{
  'mylib|lib/design-system.json':
      '''
{
  "colors": {
    "foo": "#FF00FF",
    "123": "#FFB6C1",
    "": "#FFB6C1"
  }
}
'''
};

const _outputInvalidColorNames = <String, String>{
  'mylib|lib/ui/identity/colors.g.dart':
      '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Colors
// **************************************************************************

import 'dart:ui';

class AppColors {
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
'''
};

const _inputInvalidColorValues = <String, String>{
  'mylib|lib/design-system.json':
      '''
{
  "colors": {
    "foo": "bar",
    "wrong": "#ffff"
  }
}
'''
};

const _outputInvalidColorValues = <String, String>{
  'mylib|lib/ui/identity/colors.g.dart':
      '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Colors
// **************************************************************************

import 'dart:ui';

class AppColors {
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
'''
};

const _inputAlphaChannels = <String, String>{
  'mylib|lib/design-system.json':
      '''
{
  "colors": {
    "withAlpha": "#aabbccdd",
    "withoutAlpha": "#aabbcc"
  }
}
'''
};

const _outputAlphaChannels = <String, String>{
  'mylib|lib/ui/identity/colors.g.dart':
      '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Colors
// **************************************************************************

import 'dart:ui';

class AppColors {
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
'''
};

class AppColors {
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
