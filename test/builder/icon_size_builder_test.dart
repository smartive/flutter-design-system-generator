import 'package:build_test/build_test.dart';
import 'package:design_system_generator/src/builder/icon_size_builder.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IconSizeBuilder', () {
    for (final (name, inputs, outputs) in _cases) {
      test('should generate correct code ($name).',
          () => testBuilder(IconSizeBuilder(), inputs, outputs: outputs));
    }
  });
}

final _cases = <(String, Map<String, String>, Map<String, String>)>[
  ('empty input', {}, {}),
  ('no design system', {'a|lib/design_system.dart': ''}, {}),
  (
    'multiple design system',
    {
      'a|lib/a.design-system.json': '{"iconSizes": {"a": 16, "b": 24}}',
      'a|lib/b.design-system.json': '{"iconSizes": {"c": 32, "d": 64}}'
    },
    {
      'a|lib/a.icon_size.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - icon_size
// *************************************************************************

abstract final class AppIconSizes {
  /// a (16.0px)
  static const a = 16.0;

  /// b (24.0px)
  static const b = 24.0;
}

enum AppIconSize {
  /// a (16.0px)
  a(AppIconSizes.a),

  /// b (24.0px)
  b(AppIconSizes.b);

  const AppIconSize(this.value);

  final double value;

  int get integer => value.toInt();
}
''',
      'a|lib/b.icon_size.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - icon_size
// *************************************************************************

abstract final class AppIconSizes {
  /// c (32.0px)
  static const c = 32.0;

  /// d (64.0px)
  static const d = 64.0;
}

enum AppIconSize {
  /// c (32.0px)
  c(AppIconSizes.c),

  /// d (64.0px)
  d(AppIconSizes.d);

  const AppIconSize(this.value);

  final double value;

  int get integer => value.toInt();
}
'''
    }
  ),
  (
    'valid icon sizes',
    {
      'a|lib/a.design-system.json': '''{
        "iconSizes": {
          "a": 16,
          "b": 24
        }
      }'''
    },
    {
      'a|lib/a.icon_size.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - icon_size
// *************************************************************************

abstract final class AppIconSizes {
  /// a (16.0px)
  static const a = 16.0;

  /// b (24.0px)
  static const b = 24.0;
}

enum AppIconSize {
  /// a (16.0px)
  a(AppIconSizes.a),

  /// b (24.0px)
  b(AppIconSizes.b);

  const AppIconSize(this.value);

  final double value;

  int get integer => value.toInt();
}
'''
    },
  ),
  (
    'invalid icon sizes',
    {
      'a|lib/a.design-system.json': '''{
        "iconSizes": {
          "1": "16",
          "2": 24
        }
      }'''
    },
    {
      'a|lib/a.icon_size.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - icon_size
// *************************************************************************

abstract final class AppIconSizes {
  /// size1 (0.0px)
  static const size1 = 0.0;

  /// size2 (24.0px)
  static const size2 = 24.0;
}

enum AppIconSize {
  /// size1 (0.0px)
  size1(AppIconSizes.size1),

  /// size2 (24.0px)
  size2(AppIconSizes.size2);

  const AppIconSize(this.value);

  final double value;

  int get integer => value.toInt();
}
'''
    },
  ),
  ('disabled', {'a|lib/a.design-system.json': '{"iconSizes": false}'}, {}),
];
