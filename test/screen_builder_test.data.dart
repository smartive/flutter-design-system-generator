part of 'screen_builder_test.dart';

const _inputEmptyDesignSystem = <String, String>{
  'mylib|lib/design-system.json': '''
{
}
'''
};

const _outputDefaultScreens = <String, String>{
  'mylib|lib/ui/identity/screens.g.dart':
      '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Screens & Breakpoints
// **************************************************************************

import 'package:flutter/widgets.dart';

class AppBreakpoints {
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

T responsiveValue<T>(
  T defaultValue, {
  T? sm,
  T? md,
  T? lg,
  T? xl,
}) {
  final width =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
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
'''
};

const _inputValidScreens = <String, String>{
  'mylib|lib/design-system.json': '''
{
  "screens": {
    "tablet": 200,
    "desktop": 440
  }
}
'''
};

const _outputValidScreens = <String, String>{
  'mylib|lib/ui/identity/screens.g.dart':
      '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Screens & Breakpoints
// **************************************************************************

import 'package:flutter/widgets.dart';

class AppBreakpoints {
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

T responsiveValue<T>(
  T defaultValue, {
  T? tablet,
  T? desktop,
}) {
  final width =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
  final values = {
    AppBreakpoints.desktop: desktop,
    AppBreakpoints.tablet: tablet,
  };
  return values.entries
      .skipWhile((e) => e.key > width)
      .map((e) => e.value)
      .firstWhere((e) => e != null, orElse: () => defaultValue) as T;
}
'''
};

const _inputInvalidScreenNames = <String, String>{
  'mylib|lib/design-system.json': '''
{
  "screens": {
    "1": 200,
    "2": 440
  }
}
'''
};

const _outputInvalidScreenNames = <String, String>{
  'mylib|lib/ui/identity/screens.g.dart':
      '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Screens & Breakpoints
// **************************************************************************

import 'package:flutter/widgets.dart';

class AppBreakpoints {
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

T responsiveValue<T>(
  T defaultValue, {
  T? screen1,
  T? screen2,
}) {
  final width =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
  final values = {
    AppBreakpoints.screen2: screen2,
    AppBreakpoints.screen1: screen1,
  };
  return values.entries
      .skipWhile((e) => e.key > width)
      .map((e) => e.value)
      .firstWhere((e) => e != null, orElse: () => defaultValue) as T;
}
'''
};

class AppBreakpoints {
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

T responsiveValue<T>(
  T defaultValue, {
  T? sm,
  T? md,
  T? lg,
  T? xl,
}) {
  final width =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
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
