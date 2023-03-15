import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';

class BorderRadiusBuilder extends Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final content = await buildStep.readAsString(buildStep.inputId);
    final json = jsonDecode(content) as Map<String, dynamic>;
    final output = buildStep.allowedOutputs.first;

    final spatials = json.containsKey('borderRadius')
        ? (_parseRadii(json['borderRadius']).toList(growable: false)
          ..sort((a, b) => a.name.compareTo(b.name)))
        : _default;

    for (final spatial in spatials) {
      if (!spatial.isValid) {
        log.info(
            'Radius ${spatial.name} does not start with character, it will be prefixed with "radius".');
      }
    }

    log.info('Generated ${spatials.length} radii.');

    return buildStep.writeAsString(output, _source(spatials));
  }

  @override
  Map<String, List<String>> get buildExtensions => const {
        r'design-system.json': ['ui/identity/border_radii.g.dart']
      };
}

String _source(Iterable<_DesignSystemBorderRadius> spatials) =>
    '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Border Radii
// **************************************************************************

import 'package:flutter/widgets.dart';

${_class(spatials)}
${_enum(spatials)}
''';

String _class(Iterable<_DesignSystemBorderRadius> spatials) => '''
class AppBorderRadii {
  AppBorderRadii._();

${spatials.map((e) => [
          '  /// ${e.validName} (${e.radius}px)',
          '  static const ${e.validName} = ${e.radius};'
        ].join('\n')).join('\n')}
}
''';

String _enum(Iterable<_DesignSystemBorderRadius> spatials) => '''
enum AppBorderRadius {
${spatials.map((e) => [
          '  /// ${e.validName} (${e.radius}px)',
          '  ${e.validName}(AppBorderRadii.${e.validName})'
        ].join('\n')).join(',\n')};

  const AppBorderRadius(this.radius);

  final double radius;

  BorderRadius get all =>
      only(topLeft: true, topRight: true, bottomLeft: true, bottomRight: true);

  BorderRadius get bottom => only(bottomLeft: true, bottomRight: true);

  BorderRadius get left => only(topLeft: true, bottomLeft: true);

  BorderRadius get right => only(topRight: true, bottomRight: true);

  BorderRadius get top => only(topLeft: true, topRight: true);

  BorderRadius only(
          {bool topLeft = false,
          bool topRight = false,
          bool bottomLeft = false,
          bool bottomRight = false}) =>
      BorderRadius.only(
        topLeft: topLeft ? Radius.circular(radius) : Radius.zero,
        topRight: topRight ? Radius.circular(radius) : Radius.zero,
        bottomLeft: bottomLeft ? Radius.circular(radius) : Radius.zero,
        bottomRight: bottomRight ? Radius.circular(radius) : Radius.zero,
      );
}
''';

Iterable<_DesignSystemBorderRadius> _parseRadii(
    Map<String, dynamic> radii) sync* {
  for (final e in radii.entries) {
    if (e.value is double) {
      yield _DesignSystemBorderRadius(e.key, e.value);
    } else if (e.value is int) {
      yield _DesignSystemBorderRadius(e.key, e.value.toDouble());
    }
  }
}

const _default = [
  _DesignSystemBorderRadius('none', 0),
  _DesignSystemBorderRadius('small', 2),
  _DesignSystemBorderRadius('rounded', 4),
  _DesignSystemBorderRadius('medium', 6),
  _DesignSystemBorderRadius('large', 8),
  _DesignSystemBorderRadius('full', 9999),
];

class _DesignSystemBorderRadius {
  final String name;
  final double radius;

  const _DesignSystemBorderRadius(this.name, this.radius);

  @override
  String toString() => 'Border Radius $name: ${radius}px';

  bool get isValid => name.startsWith(RegExp(r'[A-Za-z]'));

  String get validName => isValid ? name : 'radius$name';
}
