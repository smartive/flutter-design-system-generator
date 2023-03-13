import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';

class ScreenBuilder extends Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final content = await buildStep.readAsString(buildStep.inputId);
    final json = jsonDecode(content) as Map<String, dynamic>;
    final output = buildStep.allowedOutputs.first;

    final screens = json.containsKey('screens')
        ? (_parseScreens(json['screens']).toList(growable: false)
          ..sort((a, b) => a.width.compareTo(b.width)))
        : _default;

    for (final screen in screens) {
      if (!screen.isValid) {
        log.info(
            'Screen ${screen.name} does not start with character, it will be prefixed with "screen".');
      }
    }

    log.info('Generated ${screens.length} screens.');

    return buildStep.writeAsString(output, _source(screens));
  }

  @override
  Map<String, List<String>> get buildExtensions => const {
        r'design-system.json': ['ui/identity/screens.g.dart']
      };
}

String _source(Iterable<_DesignSystemScreen> screens) =>
    '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Screens & Breakpoints
// **************************************************************************

import 'package:flutter/widgets.dart';

${_class(screens)}
${_enum(screens)}
${_responsiveHelper(screens)}
''';

String _class(Iterable<_DesignSystemScreen> screens) => '''
class AppBreakpoints {
  AppBreakpoints._();

${screens.map((e) => [
          '  /// ${e.validName} (${e.width}px) - media query width >= ${e.width}px',
          '  static const ${e.validName} = ${e.width};'
        ].join('\n')).join('\n')}
}
''';

String _enum(Iterable<_DesignSystemScreen> screens) => '''
enum AppBreakpoint {
${screens.map((e) => [
          '  /// ${e.validName} (${e.width}px)',
          '  ${e.validName}(AppBreakpoints.${e.validName})'
        ].join('\n')).join(',\n')};

  const AppBreakpoint(this.width);

  final double width;

  int get integerWidth => width.toInt();
}
''';

String _responsiveHelper(Iterable<_DesignSystemScreen> screens) => '''
T responsiveValue<T>(
  T defaultValue, {
${screens.map((e) => '  T? ${e.validName},').join('\n')}
}) {
  final width =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
  final values = {
${screens.toList().reversed.map((e) => '    AppBreakpoints.${e.validName}: ${e.validName},').join('\n')}
  };
  return values.entries
      .skipWhile((e) => e.key < width)
      .map((e) => e.value)
      .firstWhere((e) => e != null, orElse: () => defaultValue) as T;
}
''';

Iterable<_DesignSystemScreen> _parseScreens(
    Map<String, dynamic> spatials) sync* {
  for (final e in spatials.entries) {
    if (e.value is double) {
      yield _DesignSystemScreen(e.key, e.value);
    } else if (e.value is int) {
      yield _DesignSystemScreen(e.key, e.value.toDouble());
    }
  }
}

const _default = [
  _DesignSystemScreen('sm', 640),
  _DesignSystemScreen('md', 768),
  _DesignSystemScreen('lg', 1024),
  _DesignSystemScreen('xl', 1280),
];

class _DesignSystemScreen {
  final String name;
  final double width;

  const _DesignSystemScreen(this.name, this.width);

  @override
  String toString() => 'Screen $name: ${width}px';

  bool get isValid => name.startsWith(RegExp(r'[A-Za-z]'));

  String get validName => isValid ? name : 'screen$name';
}
