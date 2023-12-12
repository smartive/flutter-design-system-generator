import 'package:build_test/build_test.dart';
import 'package:design_system_generator/src/builder/border_width_builder.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BorderWidthBuilder', () {
    for (final (name, inputs, outputs) in _cases) {
      test('should generate correct code ($name).',
          () => testBuilder(BorderWidthBuilder(), inputs, outputs: outputs));
    }
  });
}

final _cases = <(String, Map<String, String>, Map<String, String>)>[
  ('empty input', {}, {}),
  ('no design system', {'a|lib/design_system.dart': ''}, {}),
  (
    'multiple design system',
    {
      'a|lib/a.design-system.json': '{"borderWidths": {"b1": 1, "b2": 2}}',
      'a|lib/b.design-system.json': '{"borderWidths": {"b3": 3, "b4": 4}}'
    },
    {
      'a|lib/a.border_widths.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - border_widths
// *************************************************************************

abstract final class AppBorderWidths {
  /// b1 (1.0px)
  static const b1 = 1.0;

  /// b2 (2.0px)
  static const b2 = 2.0;
}

enum AppBorderWidth {
  /// b1 (1.0px)
  b1(AppBorderWidths.b1),

  /// b2 (2.0px)
  b2(AppBorderWidths.b2);

  const AppBorderWidth(this.width);

  final double width;
}
''',
      'a|lib/b.border_widths.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - border_widths
// *************************************************************************

abstract final class AppBorderWidths {
  /// b3 (3.0px)
  static const b3 = 3.0;

  /// b4 (4.0px)
  static const b4 = 4.0;
}

enum AppBorderWidth {
  /// b3 (3.0px)
  b3(AppBorderWidths.b3),

  /// b4 (4.0px)
  b4(AppBorderWidths.b4);

  const AppBorderWidth(this.width);

  final double width;
}
'''
    }
  ),
  (
    'valid border widths',
    {
      'a|lib/a.design-system.json': '''{
        "borderWidths": {
          "b1": 1,
          "b2": 2
        }
      }'''
    },
    {
      'a|lib/a.border_widths.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - border_widths
// *************************************************************************

abstract final class AppBorderWidths {
  /// b1 (1.0px)
  static const b1 = 1.0;

  /// b2 (2.0px)
  static const b2 = 2.0;
}

enum AppBorderWidth {
  /// b1 (1.0px)
  b1(AppBorderWidths.b1),

  /// b2 (2.0px)
  b2(AppBorderWidths.b2);

  const AppBorderWidth(this.width);

  final double width;
}
'''
    },
  ),
  (
    'invalid border widths',
    {
      'a|lib/a.design-system.json': '''{
        "borderWidths": {
          "b1": "1",
          "b2": 2
        }
      }'''
    },
    {
      'a|lib/a.border_widths.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - border_widths
// *************************************************************************

abstract final class AppBorderWidths {
  /// b1 (0.0px)
  static const b1 = 0.0;

  /// b2 (2.0px)
  static const b2 = 2.0;
}

enum AppBorderWidth {
  /// b1 (0.0px)
  b1(AppBorderWidths.b1),

  /// b2 (2.0px)
  b2(AppBorderWidths.b2);

  const AppBorderWidth(this.width);

  final double width;
}
'''
    },
  ),
  ('disabled', {'a|lib/a.design-system.json': '{"borderWidths": false}'}, {}),
];
