// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - screens
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i1;

abstract final class AppBreakpoints {
  /// medium (700.0px) - media query width >= 700.0px
  static const medium = 700.0;

  /// big (1200.0px) - media query width >= 1200.0px
  static const big = 1200.0;
}

enum AppBreakpoint {
  /// medium (700.0px) - media query width >= 700.0px
  medium(AppBreakpoints.medium),

  /// big (1200.0px) - media query width >= 1200.0px
  big(AppBreakpoints.big);

  const AppBreakpoint(this.width);

  final double width;

  int get integerWidth => width.toInt();
}

/// Return a specific value based on the current window/view size.
/// If a [context] is provided, `View.of(context)` determines the
/// size, otherwise the platformDispatcher is used.
///
/// Returns the biggest possible value of the defined breakpoints.
/// If the screen is smaller than the smallest breakpoint, [defaultValue]
/// is returned.
///
/// Breakpoints:
/// - medium (700.0px)
/// - big (1200.0px)
T responsiveValue<T>(
  T defaultValue, {
  _i1.BuildContext? context,
  T? medium,
  T? big,
}) {
  final width = context != null
      ? _i1.View.of(context).physicalSize.width
      : _i1.WidgetsBinding.instance.platformDispatcher.views.first.physicalSize
          .width;
  final values = {AppBreakpoints.big: big, AppBreakpoints.medium: medium};
  return (values.entries
      .skipWhile((e) => e.key > width)
      .map((e) => e.value)
      .firstWhere((e) => e != null, orElse: () => defaultValue) as T);
}
