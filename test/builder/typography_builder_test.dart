import 'package:build_test/build_test.dart';
import 'package:design_system_generator/src/builder/typography_builder.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TypographyBuilder', () {
    for (final (name, inputs, outputs) in _cases) {
      test('should generate correct code ($name).',
          () => testBuilder(TypographyBuilder(), inputs, outputs: outputs));
    }
  });
}

const _multi = '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - typography
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i1;

abstract final class AppTypographies {
  /// Text Style Definition foo
  static const foo = _i1.TextStyle(
    fontFamily: 'f',
    fontWeight: null,
    fontSize: null,
    height: null,
    letterSpacing: null,
    wordSpacing: null,
  );
}

enum AppTypography {
  /// foo
  foo(AppTypographies.foo);

  const AppTypography(this.textStyle);

  final _i1.TextStyle textStyle;
}
''';

final _cases = <(String, Map<String, String>, Map<String, String>)>[
  ('empty input', {}, {}),
  ('no design system', {'a|lib/design_system.dart': ''}, {}),
  (
    'multiple design system',
    {
      'a|lib/a.design-system.json': '{"typography": {"foo": {"family": "f"}}}',
      'a|lib/b.design-system.json': '{"typography": {"foo": {"family": "f"}}}',
    },
    {'a|lib/a.typography.dart': _multi, 'a|lib/b.typography.dart': _multi},
  ),
  (
    'default typography',
    {'a|lib/a.design-system.json': '{}'},
    {},
  ),
  (
    'valid typography',
    {
      'a|lib/a.design-system.json': '''{
        "typography": {
          "root": {
            "family": "Arial",
            "size": 16,
            "weight": 400,
            "lineHeight": 32,
            "letterSpacing": 1.2,
            "wordSpacing": 2.2
          },
          "partial": {
            "family": "Arial",
            "size": 16,
            "letterSpacing": 1.2
          },
          "heading": {
            "DEFAULT": {
              "family": "default"
            },
            "1": {
              "family": "h1"
            }
          }
        }
      }'''
    },
    {
      'a|lib/a.typography.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - typography
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i1;

abstract final class AppTypographies {
  /// Text Style Definition heading
  static const heading = _i1.TextStyle(
    fontFamily: 'default',
    fontWeight: null,
    fontSize: null,
    height: null,
    letterSpacing: null,
    wordSpacing: null,
  );

  /// Text Style Definition heading1
  static const heading1 = _i1.TextStyle(
    fontFamily: 'h1',
    fontWeight: null,
    fontSize: null,
    height: null,
    letterSpacing: null,
    wordSpacing: null,
  );

  /// Text Style Definition partial
  static const partial = _i1.TextStyle(
    fontFamily: 'Arial',
    fontWeight: null,
    fontSize: 16.0,
    height: null,
    letterSpacing: 1.2,
    wordSpacing: null,
  );

  /// Text Style Definition root
  static const root = _i1.TextStyle(
    fontFamily: 'Arial',
    fontWeight: _i1.FontWeight.w400,
    fontSize: 16.0,
    height: 2.0,
    letterSpacing: 1.2,
    wordSpacing: 2.2,
  );
}

enum AppTypography {
  /// heading
  heading(AppTypographies.heading),

  /// heading1
  heading1(AppTypographies.heading1),

  /// partial
  partial(AppTypographies.partial),

  /// root
  root(AppTypographies.root);

  const AppTypography(this.textStyle);

  final _i1.TextStyle textStyle;
}
'''
    },
  ),
  (
    'invalid typography',
    {
      'a|lib/a.design-system.json': '''{
        "typography": {
          "11": {"family": "Arial"}
        }
      }'''
    },
    {
      'a|lib/a.typography.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - typography
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i1;

abstract final class AppTypographies {
  /// Text Style Definition typo11
  static const typo11 = _i1.TextStyle(
    fontFamily: 'Arial',
    fontWeight: null,
    fontSize: null,
    height: null,
    letterSpacing: null,
    wordSpacing: null,
  );
}

enum AppTypography {
  /// typo11
  typo11(AppTypographies.typo11);

  const AppTypography(this.textStyle);

  final _i1.TextStyle textStyle;
}
'''
    },
  ),
  ('disabled', {'a|lib/a.design-system.json': '{"typography": false}'}, {}),
];
