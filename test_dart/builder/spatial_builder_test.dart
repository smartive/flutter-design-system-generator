import 'package:build_test/build_test.dart';
import 'package:design_system_generator/src/builder/spatial_builder.dart';
import 'package:test/test.dart';

void main() {
  group('SpatialBuilder', () {
    for (final (name, inputs, outputs) in _cases) {
      test(
        'should generate correct code ($name).',
        () => testBuilder(
          SpatialBuilder(),
          inputs,
          outputs: outputs,
          rootPackage: 'design_system_generator',
        ),
      );
    }
  });
}

const _default = '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - spatials
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i1;

abstract final class AppSpatials {
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

  _i1.SizedBox get verticalSpacer => _i1.SizedBox(height: value);

  _i1.SizedBox get horizontalSpacer => _i1.SizedBox(width: value);

  _i1.EdgeInsets get insetsAll => _i1.EdgeInsets.all(value);

  _i1.EdgeInsets get insetsHorizontal =>
      _i1.EdgeInsets.symmetric(horizontal: value);

  _i1.EdgeInsets get insetsVertical =>
      _i1.EdgeInsets.symmetric(vertical: value);

  _i1.EdgeInsets get insetsTop => _i1.EdgeInsets.only(top: value);

  _i1.EdgeInsets get insetsBottom => _i1.EdgeInsets.only(bottom: value);

  _i1.EdgeInsets get insetsLeft => _i1.EdgeInsets.only(left: value);

  _i1.EdgeInsets get insetsRight => _i1.EdgeInsets.only(right: value);

  _i1.EdgeInsets only({
    bool left = false,
    bool top = false,
    bool right = false,
    bool bottom = false,
  }) => _i1.EdgeInsets.only(
    left: left ? value : 0,
    right: right ? value : 0,
    top: top ? value : 0,
    bottom: bottom ? value : 0,
  );

  _i1.EdgeInsets combine({
    AppSpatial? left,
    AppSpatial? top,
    AppSpatial? right,
    AppSpatial? bottom,
  }) => insetsAll.copyWith(
    left: left?.value,
    top: top?.value,
    right: right?.value,
    bottom: bottom?.value,
  );
}
''';

final _cases = <(String, Map<String, String>, Map<String, String>)>[
  ('empty input', {}, {}),
  ('no design system', {'a|lib/design_system.dart': ''}, {}),
  (
    'multiple design system',
    {'a|lib/a.design-system.json': '{}', 'a|lib/b.design-system.json': '{}'},
    {'a|lib/a.spatials.dart': _default, 'a|lib/b.spatials.dart': _default},
  ),
  (
    'default spatials',
    {'a|lib/a.design-system.json': '{}'},
    {'a|lib/a.spatials.dart': _default},
  ),
  (
    'valid spatials',
    {
      'a|lib/a.design-system.json': '''{
        "spacings": {
          "a": 2,
          "b": 4
        }
      }''',
    },
    {
      'a|lib/a.spatials.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - spatials
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i1;

abstract final class AppSpatials {
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

  _i1.SizedBox get verticalSpacer => _i1.SizedBox(height: value);

  _i1.SizedBox get horizontalSpacer => _i1.SizedBox(width: value);

  _i1.EdgeInsets get insetsAll => _i1.EdgeInsets.all(value);

  _i1.EdgeInsets get insetsHorizontal =>
      _i1.EdgeInsets.symmetric(horizontal: value);

  _i1.EdgeInsets get insetsVertical =>
      _i1.EdgeInsets.symmetric(vertical: value);

  _i1.EdgeInsets get insetsTop => _i1.EdgeInsets.only(top: value);

  _i1.EdgeInsets get insetsBottom => _i1.EdgeInsets.only(bottom: value);

  _i1.EdgeInsets get insetsLeft => _i1.EdgeInsets.only(left: value);

  _i1.EdgeInsets get insetsRight => _i1.EdgeInsets.only(right: value);

  _i1.EdgeInsets only({
    bool left = false,
    bool top = false,
    bool right = false,
    bool bottom = false,
  }) => _i1.EdgeInsets.only(
    left: left ? value : 0,
    right: right ? value : 0,
    top: top ? value : 0,
    bottom: bottom ? value : 0,
  );

  _i1.EdgeInsets combine({
    AppSpatial? left,
    AppSpatial? top,
    AppSpatial? right,
    AppSpatial? bottom,
  }) => insetsAll.copyWith(
    left: left?.value,
    top: top?.value,
    right: right?.value,
    bottom: bottom?.value,
  );
}
''',
    },
  ),
  (
    'invalid spatials',
    {
      'a|lib/a.design-system.json': '''{
        "spacings": {
          "1": "2",
          "2": 4
        }
      }''',
    },
    {
      'a|lib/a.spatials.dart': '''
// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - spatials
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i1;

abstract final class AppSpatials {
  /// spatial1 (0.0px)
  static const spatial1 = 0.0;

  /// spatial2 (4.0px)
  static const spatial2 = 4.0;
}

enum AppSpatial {
  /// spatial1 (0.0px)
  spatial1(AppSpatials.spatial1),

  /// spatial2 (4.0px)
  spatial2(AppSpatials.spatial2);

  const AppSpatial(this.value);

  final double value;

  int get integer => value.toInt();

  _i1.SizedBox get verticalSpacer => _i1.SizedBox(height: value);

  _i1.SizedBox get horizontalSpacer => _i1.SizedBox(width: value);

  _i1.EdgeInsets get insetsAll => _i1.EdgeInsets.all(value);

  _i1.EdgeInsets get insetsHorizontal =>
      _i1.EdgeInsets.symmetric(horizontal: value);

  _i1.EdgeInsets get insetsVertical =>
      _i1.EdgeInsets.symmetric(vertical: value);

  _i1.EdgeInsets get insetsTop => _i1.EdgeInsets.only(top: value);

  _i1.EdgeInsets get insetsBottom => _i1.EdgeInsets.only(bottom: value);

  _i1.EdgeInsets get insetsLeft => _i1.EdgeInsets.only(left: value);

  _i1.EdgeInsets get insetsRight => _i1.EdgeInsets.only(right: value);

  _i1.EdgeInsets only({
    bool left = false,
    bool top = false,
    bool right = false,
    bool bottom = false,
  }) => _i1.EdgeInsets.only(
    left: left ? value : 0,
    right: right ? value : 0,
    top: top ? value : 0,
    bottom: bottom ? value : 0,
  );

  _i1.EdgeInsets combine({
    AppSpatial? left,
    AppSpatial? top,
    AppSpatial? right,
    AppSpatial? bottom,
  }) => insetsAll.copyWith(
    left: left?.value,
    top: top?.value,
    right: right?.value,
    bottom: bottom?.value,
  );
}
''',
    },
  ),
  ('disabled', {'a|lib/a.design-system.json': '{"spacings": false}'}, {}),
];
