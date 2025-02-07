import 'package:build_test/build_test.dart';
import 'package:design_system_generator/src/builder/color_builder.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ColorBuilder', () {
    for (final (name, inputs, outputs) in _cases) {
      test('should generate correct code ($name).',
          () => testBuilder(ColorBuilder(), inputs, outputs: outputs));
    }
  });
}

const _default = '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - colors
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i1;

abstract final class AppColors {
  static const black = _i1.Color(0xFF000000);

  static const white = _i1.Color(0xFFFFFFFF);

  static const transparent = _i1.Color(0x00000000);
}

enum AppColor {
  black(AppColors.black),
  white(AppColors.white),
  transparent(AppColors.transparent);

  const AppColor(this.color);

  final _i1.Color color;

  _i1.Color withOpacity(double opacity) => color.withValues(alpha: opacity);
  static AppColor fromColor(_i1.Color color, [AppColor? orElse]) =>
      AppColor.values.firstWhere(
        (e) => e.color == color,
        orElse: orElse == null ? null : () => orElse,
      );
}
''';

final _cases = <(String, Map<String, String>, Map<String, String>)>[
  ('empty input', {}, {}),
  ('no design system', {'a|lib/design_system.dart': ''}, {}),
  (
    'multiple design system',
    {'a|lib/a.design-system.json': '{}', 'a|lib/b.design-system.json': '{}'},
    {'a|lib/a.colors.dart': _default, 'a|lib/b.colors.dart': _default},
  ),
  (
    'default colors',
    {'a|lib/a.design-system.json': '{}'},
    {'a|lib/a.colors.dart': _default},
  ),
  (
    'valid colors',
    {
      'a|lib/a.design-system.json': '''{
        "colors": {
          "tripple": "#abc",
          "withAlpha": "#aabbccdd",
          "withoutAlpha": "#aabbcc",
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
      }'''
    },
    {
      'a|lib/a.colors.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - colors
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i1;

abstract final class AppColors {
  static const pink = _i1.Color(0xFF000000);

  static const pinkBase = _i1.Color(0xFFFFC0CB);

  static const pinkDark100 = _i1.Color(0xFFFFB6C1);

  static const pinkDark50 = _i1.Color(0xFFFFC0CB);

  static const pinkLight = _i1.Color(0xFFFFB6C1);

  static const tripple = _i1.Color(0xFFaabbcc);

  static const withAlpha = _i1.Color(0xddaabbcc);

  static const withoutAlpha = _i1.Color(0xFFaabbcc);
}

enum AppColor {
  pink(AppColors.pink),
  pinkBase(AppColors.pinkBase),
  pinkDark100(AppColors.pinkDark100),
  pinkDark50(AppColors.pinkDark50),
  pinkLight(AppColors.pinkLight),
  tripple(AppColors.tripple),
  withAlpha(AppColors.withAlpha),
  withoutAlpha(AppColors.withoutAlpha);

  const AppColor(this.color);

  final _i1.Color color;

  _i1.Color withOpacity(double opacity) => color.withValues(alpha: opacity);
  static AppColor fromColor(_i1.Color color, [AppColor? orElse]) =>
      AppColor.values.firstWhere(
        (e) => e.color == color,
        orElse: orElse == null ? null : () => orElse,
      );
}
'''
    },
  ),
  (
    'invalid colors',
    {
      'a|lib/a.design-system.json': '''{
        "colors": {
          "foo": "bar",
          "123": "#aabbccdd"
        }
      }'''
    },
    {
      'a|lib/a.colors.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - colors
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i1;

abstract final class AppColors {
  static const color123 = _i1.Color(0xddaabbcc);

  /// foo contains a non-valid 6 or 8 char hex string ("bar").
  static const foo = _i1.Color(0x00000000);
}

enum AppColor {
  color123(AppColors.color123),
  foo(AppColors.foo);

  const AppColor(this.color);

  final _i1.Color color;

  _i1.Color withOpacity(double opacity) => color.withValues(alpha: opacity);
  static AppColor fromColor(_i1.Color color, [AppColor? orElse]) =>
      AppColor.values.firstWhere(
        (e) => e.color == color,
        orElse: orElse == null ? null : () => orElse,
      );
}
'''
    },
  ),
  ('disabled', {'a|lib/a.design-system.json': '{"colors": false}'}, {}),
];
