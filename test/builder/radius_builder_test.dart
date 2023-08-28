import 'dart:convert';
import 'dart:io';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:design_system_generator/src/builder/radius_builder.dart';
import 'package:flutter_test/flutter_test.dart';

class OutputWriter extends InMemoryAssetWriter {
  final String name;

  OutputWriter(this.name);

  @override
  Future writeAsString(AssetId id, String contents,
      {Encoding encoding = utf8}) async {
    await super.writeAsString(id, contents, encoding: encoding);

    final f = await File('test/$name.txt').create();
    final w = f.openWrite(mode: FileMode.append);
    w.writeln(id);
    w.writeln(contents);
    w.writeln();
  }
}

void main() {
  group('RadiusBuilder', () {
    for (final (name, inputs, outputs) in _cases) {
      test('should generate correct code ($name).',
          () => testBuilder(RadiusBuilder(), inputs, outputs: outputs));
    }
  });
}

const _default = '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - radii
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i1;

abstract final class AppBorderRadii {
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

  _i1.Radius get asRadius => _i1.Radius.circular(radius);
  _i1.BorderRadius get all =>
      only(topLeft: true, topRight: true, bottomLeft: true, bottomRight: true);
  _i1.BorderRadius get bottom => only(bottomLeft: true, bottomRight: true);
  _i1.BorderRadius get left => only(topLeft: true, bottomLeft: true);
  _i1.BorderRadius get right => only(topRight: true, bottomRight: true);
  _i1.BorderRadius get top => only(topLeft: true, topRight: true);
  _i1.BorderRadius only({
    bool topLeft = false,
    bool topRight = false,
    bool bottomLeft = false,
    bool bottomRight = false,
  }) =>
      _i1.BorderRadius.only(
        topLeft: topLeft ? asRadius : _i1.Radius.zero,
        topRight: topRight ? asRadius : _i1.Radius.zero,
        bottomLeft: bottomLeft ? asRadius : _i1.Radius.zero,
        bottomRight: bottomRight ? asRadius : _i1.Radius.zero,
      );
  _i1.BorderRadius combine({
    AppBorderRadius? topLeft,
    AppBorderRadius? topRight,
    AppBorderRadius? bottomLeft,
    AppBorderRadius? bottomRight,
  }) =>
      all.copyWith(
        topLeft: topLeft?.asRadius,
        topRight: topRight?.asRadius,
        bottomLeft: bottomLeft?.asRadius,
        bottomRight: bottomRight?.asRadius,
      );
}
''';

final _cases = <(String, Map<String, String>, Map<String, String>)>[
  ('empty input', {}, {}),
  ('no design system', {'a|lib/design_system.dart': ''}, {}),
  (
    'multiple design system',
    {'a|lib/a.design-system.json': '{}', 'a|lib/b.design-system.json': '{}'},
    {'a|lib/a.radii.dart': _default, 'a|lib/b.radii.dart': _default},
  ),
  (
    'default radius',
    {'a|lib/a.design-system.json': '{}'},
    {'a|lib/a.radii.dart': _default},
  ),
  (
    'valid radii',
    {
      'a|lib/a.design-system.json': '''{
        "borderRadius": {
          "first": 15,
          "second": 30
        }
      }'''
    },
    {
      'a|lib/a.radii.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - radii
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i1;

abstract final class AppBorderRadii {
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

  _i1.Radius get asRadius => _i1.Radius.circular(radius);
  _i1.BorderRadius get all =>
      only(topLeft: true, topRight: true, bottomLeft: true, bottomRight: true);
  _i1.BorderRadius get bottom => only(bottomLeft: true, bottomRight: true);
  _i1.BorderRadius get left => only(topLeft: true, bottomLeft: true);
  _i1.BorderRadius get right => only(topRight: true, bottomRight: true);
  _i1.BorderRadius get top => only(topLeft: true, topRight: true);
  _i1.BorderRadius only({
    bool topLeft = false,
    bool topRight = false,
    bool bottomLeft = false,
    bool bottomRight = false,
  }) =>
      _i1.BorderRadius.only(
        topLeft: topLeft ? asRadius : _i1.Radius.zero,
        topRight: topRight ? asRadius : _i1.Radius.zero,
        bottomLeft: bottomLeft ? asRadius : _i1.Radius.zero,
        bottomRight: bottomRight ? asRadius : _i1.Radius.zero,
      );
  _i1.BorderRadius combine({
    AppBorderRadius? topLeft,
    AppBorderRadius? topRight,
    AppBorderRadius? bottomLeft,
    AppBorderRadius? bottomRight,
  }) =>
      all.copyWith(
        topLeft: topLeft?.asRadius,
        topRight: topRight?.asRadius,
        bottomLeft: bottomLeft?.asRadius,
        bottomRight: bottomRight?.asRadius,
      );
}
'''
    },
  ),
  (
    'invalid radii',
    {
      'a|lib/a.design-system.json': '''{
        "borderRadius": {
          "1": "15",
          "2": 40
        }
      }'''
    },
    {
      'a|lib/a.radii.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - radii
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i1;

abstract final class AppBorderRadii {
  /// radius1 (0.0px)
  static const radius1 = 0.0;

  /// radius2 (40.0px)
  static const radius2 = 40.0;
}

enum AppBorderRadius {
  /// radius1 (0.0px)
  radius1(AppBorderRadii.radius1),

  /// radius2 (40.0px)
  radius2(AppBorderRadii.radius2);

  const AppBorderRadius(this.radius);

  final double radius;

  _i1.Radius get asRadius => _i1.Radius.circular(radius);
  _i1.BorderRadius get all =>
      only(topLeft: true, topRight: true, bottomLeft: true, bottomRight: true);
  _i1.BorderRadius get bottom => only(bottomLeft: true, bottomRight: true);
  _i1.BorderRadius get left => only(topLeft: true, bottomLeft: true);
  _i1.BorderRadius get right => only(topRight: true, bottomRight: true);
  _i1.BorderRadius get top => only(topLeft: true, topRight: true);
  _i1.BorderRadius only({
    bool topLeft = false,
    bool topRight = false,
    bool bottomLeft = false,
    bool bottomRight = false,
  }) =>
      _i1.BorderRadius.only(
        topLeft: topLeft ? asRadius : _i1.Radius.zero,
        topRight: topRight ? asRadius : _i1.Radius.zero,
        bottomLeft: bottomLeft ? asRadius : _i1.Radius.zero,
        bottomRight: bottomRight ? asRadius : _i1.Radius.zero,
      );
  _i1.BorderRadius combine({
    AppBorderRadius? topLeft,
    AppBorderRadius? topRight,
    AppBorderRadius? bottomLeft,
    AppBorderRadius? bottomRight,
  }) =>
      all.copyWith(
        topLeft: topLeft?.asRadius,
        topRight: topRight?.asRadius,
        bottomLeft: bottomLeft?.asRadius,
        bottomRight: bottomRight?.asRadius,
      );
}
'''
    },
  ),
  ('disabled', {'a|lib/a.design_system.json': '{"borderRadius": false}'}, {}),
];
