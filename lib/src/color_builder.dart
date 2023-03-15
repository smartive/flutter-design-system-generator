import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';

class ColorBuilder extends Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final content = await buildStep.readAsString(buildStep.inputId);
    final json = jsonDecode(content) as Map<String, dynamic>;
    final output = buildStep.allowedOutputs.first;

    final colors = json.containsKey('colors')
        ? (_parseColors(json['colors']).toList(growable: false)
          ..sort((a, b) => a.name.compareTo(b.name)))
        : _default;

    for (final color in colors) {
      if (!color.isValid) {
        log.warning('Color ${color.name} is not valid 6 or 8 digit hex.');
      }

      if (!color.isNameValid) {
        log.info(
            'Color ${color.name} does not start with character, it will be prefixed with "color".');
      }
    }

    log.info('Generated ${colors.length} colors.');

    return buildStep.writeAsString(output, _source(colors));
  }

  @override
  Map<String, List<String>> get buildExtensions => const {
        r'design-system.json': ['ui/identity/colors.g.dart']
      };
}

String _source(Iterable<_DesignSystemColor> colors) =>
    '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Colors
// **************************************************************************

import 'dart:ui';

${_class(colors)}
${_enum(colors)}''';

String _class(Iterable<_DesignSystemColor> colors) => '''
class AppColors {
  AppColors._();

${colors.map((e) => [
          if (!e.isValid)
            '  // ${e.validName} contains a non-valid 6 or 8 char hex string ("${e.hex}").',
          '  static const ${e.validName} = Color(0x${e.colorHex});'
        ].join('\n')).join('\n')}
}
''';

String _enum(Iterable<_DesignSystemColor> colors) => '''
enum AppColor {
${colors.map((e) => '  ${e.validName}(AppColors.${e.validName})').join(',\n')};

  const AppColor(this.color);

  final Color color;

  Color withOpacity(double opacity) => color.withOpacity(opacity);

  static AppColor fromColor(Color color, [AppColor? orElse]) =>
      AppColor.values.firstWhere((e) => e.color == color,
          orElse: orElse == null ? null : () => orElse);
}
''';

Iterable<_DesignSystemColor> _parseColors(Map<String, dynamic> colors,
    [String prefix = '']) sync* {
  for (final e in colors.entries) {
    final name = e.key.replaceAll('DEFAULT', '');
    if (e.value is String) {
      yield _DesignSystemColor('$prefix$name', e.value);
    } else if (e.value is Map<String, dynamic>) {
      yield* _parseColors(e.value as Map<String, dynamic>, name);
    }
  }
}

const _default = [
  _DesignSystemColor('black', '#000000'),
  _DesignSystemColor('white', '#FFFFFF'),
  _DesignSystemColor('transparent', '#00000000'),
];

class _DesignSystemColor {
  final String name;
  final String hex;

  const _DesignSystemColor(this.name, this.hex);

  @override
  String toString() => 'Color $name: $hex';

  bool get isValid =>
      RegExp(r'^#([0-9a-fA-F]{6}|[0-9a-fA-F]{8})$').hasMatch(hex);

  String get colorHex {
    if (!isValid) {
      return '00000000';
    }

    if (hex.length == 7) {
      return 'FF${hex.substring(1)}';
    }

    return '${hex.substring(7, 9)}${hex.substring(1, 7)}';
  }

  bool get isNameValid => name.startsWith(RegExp(r'[A-Za-z]'));

  String get validName => isNameValid ? name : 'color$name';
}
