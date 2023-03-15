import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';

class SpatialBuilder extends Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final content = await buildStep.readAsString(buildStep.inputId);
    final json = jsonDecode(content) as Map<String, dynamic>;
    final output = buildStep.allowedOutputs.first;

    final spatials = json.containsKey('spacings')
        ? (_parseSpatials(json['spacings']).toList(growable: false)
          ..sort((a, b) => a.name.compareTo(b.name)))
        : _default;

    for (final spatial in spatials) {
      if (!spatial.isValid) {
        log.info(
            'Spatial ${spatial.name} does not start with character, it will be prefixed with "spatial".');
      }
    }

    log.info('Generated ${spatials.length} spatials.');

    return buildStep.writeAsString(output, _source(spatials));
  }

  @override
  Map<String, List<String>> get buildExtensions => const {
        r'design-system.json': ['ui/identity/spatials.g.dart']
      };
}

String _source(Iterable<_DesignSystemSpatial> spatials) =>
    '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Spatials
// **************************************************************************

import 'package:flutter/widgets.dart';

${_class(spatials)}
${_enum(spatials)}''';

String _class(Iterable<_DesignSystemSpatial> spatials) => '''
class AppSpatials {
  AppSpatials._();

${spatials.map((e) => [
          '  /// ${e.validName} (${e.space}px)',
          '  static const ${e.validName} = ${e.space};'
        ].join('\n')).join('\n')}
}
''';

String _enum(Iterable<_DesignSystemSpatial> spatials) => '''
enum AppSpatial {
${spatials.map((e) => [
          '  /// ${e.validName} (${e.space}px)',
          '  ${e.validName}(AppSpatials.${e.validName})'
        ].join('\n')).join(',\n')};

  const AppSpatial(this.value);

  final double value;

  int get integer => value.toInt();

  SizedBox get verticalSpacer => SizedBox(height: value);

  SizedBox get horizontalSpacer => SizedBox(width: value);

  EdgeInsets get insetsAll => EdgeInsets.all(value);

  EdgeInsets get insetsHorizontal => EdgeInsets.symmetric(horizontal: value);

  EdgeInsets get insetsVertical => EdgeInsets.symmetric(vertical: value);

  EdgeInsets get insetsTop => EdgeInsets.only(top: value);

  EdgeInsets get insetsBottom => EdgeInsets.only(bottom: value);

  EdgeInsets get insetsLeft => EdgeInsets.only(left: value);

  EdgeInsets get insetsRight => EdgeInsets.only(right: value);
}
''';

Iterable<_DesignSystemSpatial> _parseSpatials(
    Map<String, dynamic> spatials) sync* {
  for (final e in spatials.entries) {
    if (e.value is double) {
      yield _DesignSystemSpatial(e.key, e.value);
    } else if (e.value is int) {
      yield _DesignSystemSpatial(e.key, e.value.toDouble());
    }
  }
}

const _default = [
  _DesignSystemSpatial('spatial0', 0),
  _DesignSystemSpatial('spatial1', 1),
  _DesignSystemSpatial('spatial2', 2),
  _DesignSystemSpatial('spatial4', 4),
  _DesignSystemSpatial('spatial8', 8),
  _DesignSystemSpatial('spatial10', 10),
  _DesignSystemSpatial('spatial12', 12),
  _DesignSystemSpatial('spatial14', 14),
  _DesignSystemSpatial('spatial16', 16),
  _DesignSystemSpatial('spatial20', 20),
  _DesignSystemSpatial('spatial24', 24),
  _DesignSystemSpatial('spatial28', 28),
  _DesignSystemSpatial('spatial32', 32),
  _DesignSystemSpatial('spatial36', 36),
  _DesignSystemSpatial('spatial40', 40),
  _DesignSystemSpatial('spatial48', 48),
  _DesignSystemSpatial('spatial56', 56),
  _DesignSystemSpatial('spatial64', 64),
  _DesignSystemSpatial('spatial72', 72),
  _DesignSystemSpatial('spatial80', 80),
  _DesignSystemSpatial('spatial96', 96),
  _DesignSystemSpatial('spatial112', 112),
  _DesignSystemSpatial('spatial128', 128),
  _DesignSystemSpatial('spatial144', 144),
  _DesignSystemSpatial('spatial160', 160),
  _DesignSystemSpatial('spatial176', 176),
  _DesignSystemSpatial('spatial192', 192),
  _DesignSystemSpatial('spatial208', 208),
  _DesignSystemSpatial('spatial224', 224),
  _DesignSystemSpatial('spatial240', 240),
  _DesignSystemSpatial('spatial256', 256),
  _DesignSystemSpatial('spatial288', 288),
  _DesignSystemSpatial('spatial320', 320),
  _DesignSystemSpatial('spatial384', 384),
  _DesignSystemSpatial('spatial448', 448),
  _DesignSystemSpatial('spatial512', 512),
];

class _DesignSystemSpatial {
  final String name;
  final double space;

  const _DesignSystemSpatial(this.name, this.space);

  @override
  String toString() => 'Spatial $name: ${space}px';

  bool get isValid => name.startsWith(RegExp(r'[A-Za-z]'));

  String get validName => isValid ? name : 'spatial$name';
}
