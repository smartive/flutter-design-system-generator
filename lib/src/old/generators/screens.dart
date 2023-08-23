import '../config/screen.dart';

String screenGenerator(Iterable<DesignSystemScreen> screens) {
  if (screens.isEmpty) {
    return '';
  }

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
final class AppBreakpoints {
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
/// Return a specific value based on the current window/view size.
/// If a [context] is provided, `View.of(context)` determines the
/// size, otherwise the platformDispatcher is used.
///
/// Returns the biggest possible value of the defined breakpoints.
/// If the screen is smaller than the smallest breakpoint, [defaultValue]
/// is returned.
///
/// Breakpoints:
${screens.map((e) => '/// - ${e.validName} (${e.width}px)').join('\n')}
T responsiveValue<T>(
  T defaultValue, {
  BuildContext? context,
${screens.map((e) => '  T? ${e.validName},').join('\n')}
}) {
  final width = context != null
      ? View.of(context).physicalSize.width
      : WidgetsBinding
          .instance.platformDispatcher.views.first.physicalSize.width;
  final values = {
${(screens.toList()..sort((a, b) => b.width.compareTo(a.width))).map((e) => '    AppBreakpoints.${e.validName}: ${e.validName},').join('\n')}
  };
  return values.entries
      .skipWhile((e) => e.key > width)
      .map((e) => e.value)
      .firstWhere((e) => e != null, orElse: () => defaultValue) as T;
}
T responsiveValue<T>(
  T defaultValue, {
  BuildContext? context,
  T? sm,
  T? md,
  T? lg,
  T? xl,
}) {
  final width = context != null
      ? View.of(context).physicalSize.width
      : WidgetsBinding
          .instance.platformDispatcher.views.first.physicalSize.width;
  final values = {
    AppBreakpoints.xl: xl,
    AppBreakpoints.lg: lg,
    AppBreakpoints.md: md,
    AppBreakpoints.sm: sm,
  };
  return values.entries
      .skipWhile((e) => e.key > width)
      .map((e) => e.value)
      .firstWhere((e) => e != null, orElse: () => defaultValue) as T;
}
''';
