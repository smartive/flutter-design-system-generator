import '../config/screen.dart';

String screenGenerator(Iterable<DesignSystemScreen> screens) {
  final asc = screens.toList(growable: false)
    ..sort((a, b) => a.width.compareTo(b.width));

  return '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Screens & Breakpoints
// **************************************************************************

import 'package:flutter/widgets.dart';

${_class(asc)}
${_enum(asc)}
${_responsiveHelper(asc)}''';
}

String _class(Iterable<DesignSystemScreen> screens) => '''
class AppBreakpoints {
  AppBreakpoints._();

${screens.map((e) => [
          '  /// ${e.validName} (${e.width}px) - media query width >= ${e.width}px',
          '  static const ${e.validName} = ${e.width};'
        ].join('\n')).join('\n')}
}
''';

String _enum(Iterable<DesignSystemScreen> screens) => '''
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

String _responsiveHelper(Iterable<DesignSystemScreen> screens) => '''
T responsiveValue<T>(
  T defaultValue, {
${screens.map((e) => '  T? ${e.validName},').join('\n')}
}) {
  final width =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
  final values = {
${(screens.toList()..sort((a, b) => b.width.compareTo(a.width))).map((e) => '    AppBreakpoints.${e.validName}: ${e.validName},').join('\n')}
  };
  return values.entries
      .skipWhile((e) => e.key > width)
      .map((e) => e.value)
      .firstWhere((e) => e != null, orElse: () => defaultValue) as T;
}
''';
