import 'package:build_test/build_test.dart';
import 'package:design_system_generator/src/builder/shadow_builder.dart';
import 'package:test/test.dart';

void main() {
  group('ShadowBuilder', () {
    for (final (name, inputs, outputs) in _cases) {
      test(
        'should generate correct code ($name).',
        () => testBuilder(
          ShadowBuilder(),
          inputs,
          outputs: outputs,
          rootPackage: 'design_system_generator',
        ),
      );
    }
  });
}

final _cases = <(String, Map<String, String>, Map<String, String>)>[
  ('empty input', {}, {}),
  ('no design system', {'a|lib/design_system.dart': ''}, {}),
  (
    'valid shadows',
    {
      'a|lib/a.design-system.json': '''{
        "shadows": {
          "small": {
            "blurRadius": 4,
            "spreadRadius": 0,
            "offset": { "dx": 0, "dy": 2 }
          },
          "large": {
            "blurRadius": 12,
            "spreadRadius": -2,
            "offset": { "dx": 0, "dy": 8 }
          }
        }
      }''',
    },
    {
      'a|lib/a.shadows.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - shadows
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i2;

import 'package:flutter/widgets.dart' as _i1;

import './a.colors.dart' as _i3;

abstract final class AppShadows {
  /// large (blur: 12.0px, spread: -2.0px, offset: 0.0/8.0)
  static _i1.BoxShadow large({_i2.Color color = _i3.AppColors.black}) =>
      AppShadow.large.boxShadow(color: color);

  /// small (blur: 4.0px, spread: 0.0px, offset: 0.0/2.0)
  static _i1.BoxShadow small({_i2.Color color = _i3.AppColors.black}) =>
      AppShadow.small.boxShadow(color: color);
}

enum AppShadow {
  /// large (blur: 12.0px, spread: -2.0px, offset: 0.0/8.0)
  large(12.0, -2.0, _i1.Offset(0.0, 8.0)),

  /// small (blur: 4.0px, spread: 0.0px, offset: 0.0/2.0)
  small(4.0, 0.0, _i1.Offset(0.0, 2.0));

  const AppShadow(this.blurRadius, this.spreadRadius, this.offset);

  final double blurRadius;

  final double spreadRadius;

  final _i1.Offset offset;

  _i1.BoxShadow boxShadow({_i2.Color color = _i3.AppColors.black}) =>
      _i1.BoxShadow(
        color: color,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
        offset: offset,
      );

  List<_i1.BoxShadow> asList({_i2.Color color = _i3.AppColors.black}) => [
    boxShadow(color: color),
  ];
}
''',
    },
  ),
  (
    'invalid shadow names',
    {
      'a|lib/a.design-system.json': '''{
        "shadows": {
          "123": {
            "blurRadius": 4,
            "spreadRadius": 0,
            "offset": { "dx": 0, "dy": 2 }
          }
        }
      }''',
    },
    {
      'a|lib/a.shadows.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - shadows
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i2;

import 'package:flutter/widgets.dart' as _i1;

import './a.colors.dart' as _i3;

abstract final class AppShadows {
  /// shadow123 (blur: 4.0px, spread: 0.0px, offset: 0.0/2.0)
  static _i1.BoxShadow shadow123({_i2.Color color = _i3.AppColors.black}) =>
      AppShadow.shadow123.boxShadow(color: color);
}

enum AppShadow {
  /// shadow123 (blur: 4.0px, spread: 0.0px, offset: 0.0/2.0)
  shadow123(4.0, 0.0, _i1.Offset(0.0, 2.0));

  const AppShadow(this.blurRadius, this.spreadRadius, this.offset);

  final double blurRadius;

  final double spreadRadius;

  final _i1.Offset offset;

  _i1.BoxShadow boxShadow({_i2.Color color = _i3.AppColors.black}) =>
      _i1.BoxShadow(
        color: color,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
        offset: offset,
      );

  List<_i1.BoxShadow> asList({_i2.Color color = _i3.AppColors.black}) => [
    boxShadow(color: color),
  ];
}
''',
    },
  ),
  ('disabled', {'a|lib/a.design-system.json': '{"shadows": false}'}, {}),
];
