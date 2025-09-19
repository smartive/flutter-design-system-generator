import 'package:build_test/build_test.dart';
import 'package:design_system_generator/src/builder/screen_builder.dart';
import 'package:test/test.dart';

void main() {
  group('ScreenBuilder', () {
    for (final (name, inputs, outputs) in _cases) {
      test(
        'should generate correct code ($name).',
        () => testBuilder(ScreenBuilder(), inputs, outputs: outputs),
      );
    }
  });
}

const _default = '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - screens
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i1;

abstract final class AppBreakpoints {
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
  /// sm (640.0px) - media query width >= 640.0px
  sm(AppBreakpoints.sm),

  /// md (768.0px) - media query width >= 768.0px
  md(AppBreakpoints.md),

  /// lg (1024.0px) - media query width >= 1024.0px
  lg(AppBreakpoints.lg),

  /// xl (1280.0px) - media query width >= 1280.0px
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
  _i1.BuildContext? context,
  T? sm,
  T? md,
  T? lg,
  T? xl,
}) {
  final width =
      context != null
          ? _i1.View.of(context).physicalSize.width
          : _i1
              .WidgetsBinding
              .instance
              .platformDispatcher
              .views
              .first
              .physicalSize
              .width;
  final values = {
    AppBreakpoints.xl: xl,
    AppBreakpoints.lg: lg,
    AppBreakpoints.md: md,
    AppBreakpoints.sm: sm,
  };
  return (values.entries
          .skipWhile((e) => e.key > width)
          .map((e) => e.value)
          .firstWhere((e) => e != null, orElse: () => defaultValue)
      as T);
}
''';

final _cases = <(String, Map<String, String>, Map<String, String>)>[
  ('empty input', {}, {}),
  ('no design system', {'a|lib/design_system.dart': ''}, {}),
  (
    'multiple design system',
    {'a|lib/a.design-system.json': '{}', 'a|lib/b.design-system.json': '{}'},
    {'a|lib/a.screens.dart': _default, 'a|lib/b.screens.dart': _default},
  ),
  (
    'default screens',
    {'a|lib/a.design-system.json': '{}'},
    {'a|lib/a.screens.dart': _default},
  ),
  (
    'valid screens',
    {
      'a|lib/a.design-system.json': '''{
        "screens": {
          "tablet": 200,
          "desktop": 440
        }
      }''',
    },
    {
      'a|lib/a.screens.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - screens
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i1;

abstract final class AppBreakpoints {
  /// tablet (200.0px) - media query width >= 200.0px
  static const tablet = 200.0;

  /// desktop (440.0px) - media query width >= 440.0px
  static const desktop = 440.0;
}

enum AppBreakpoint {
  /// tablet (200.0px) - media query width >= 200.0px
  tablet(AppBreakpoints.tablet),

  /// desktop (440.0px) - media query width >= 440.0px
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
  _i1.BuildContext? context,
  T? tablet,
  T? desktop,
}) {
  final width =
      context != null
          ? _i1.View.of(context).physicalSize.width
          : _i1
              .WidgetsBinding
              .instance
              .platformDispatcher
              .views
              .first
              .physicalSize
              .width;
  final values = {
    AppBreakpoints.desktop: desktop,
    AppBreakpoints.tablet: tablet,
  };
  return (values.entries
          .skipWhile((e) => e.key > width)
          .map((e) => e.value)
          .firstWhere((e) => e != null, orElse: () => defaultValue)
      as T);
}
''',
    },
  ),
  (
    'invalid screens',
    {
      'a|lib/a.design-system.json': '''{
        "screens": {
          "1": "200",
          "2": 440
        }
      }''',
    },
    {
      'a|lib/a.screens.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - screens
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i1;

abstract final class AppBreakpoints {
  /// screen1 (0.0px) - media query width >= 0.0px
  static const screen1 = 0.0;

  /// screen2 (440.0px) - media query width >= 440.0px
  static const screen2 = 440.0;
}

enum AppBreakpoint {
  /// screen1 (0.0px) - media query width >= 0.0px
  screen1(AppBreakpoints.screen1),

  /// screen2 (440.0px) - media query width >= 440.0px
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
/// - screen1 (0.0px)
/// - screen2 (440.0px)
T responsiveValue<T>(
  T defaultValue, {
  _i1.BuildContext? context,
  T? screen1,
  T? screen2,
}) {
  final width =
      context != null
          ? _i1.View.of(context).physicalSize.width
          : _i1
              .WidgetsBinding
              .instance
              .platformDispatcher
              .views
              .first
              .physicalSize
              .width;
  final values = {
    AppBreakpoints.screen2: screen2,
    AppBreakpoints.screen1: screen1,
  };
  return (values.entries
          .skipWhile((e) => e.key > width)
          .map((e) => e.value)
          .firstWhere((e) => e != null, orElse: () => defaultValue)
      as T);
}
''',
    },
  ),
  ('disabled', {'a|lib/a.design-system.json': '{"screens": false}'}, {}),
];
