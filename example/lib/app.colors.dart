// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - colors
// *************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i1;

abstract final class AppColors {
  static const black = _i1.Color(0xFF000000);

  static const halfTransparentBlue = _i1.Color(0x800000FF);

  static const neutral100 = _i1.Color(0xFFF5F5F5);

  static const neutral100Light = _i1.Color(0xFFFFFFFF);

  static const orange = _i1.Color(0xFFFFA500);

  static const orangeDark = _i1.Color(0xFFFF8C00);

  static const orangeLight = _i1.Color(0xFFFFDAB9);

  static const white = _i1.Color(0xFFFFFFFF);
}

enum AppColor {
  black(AppColors.black),
  halfTransparentBlue(AppColors.halfTransparentBlue),
  neutral100(AppColors.neutral100),
  neutral100Light(AppColors.neutral100Light),
  orange(AppColors.orange),
  orangeDark(AppColors.orangeDark),
  orangeLight(AppColors.orangeLight),
  white(AppColors.white);

  const AppColor(this.color);

  final _i1.Color color;

  _i1.Color withOpacity(double opacity) => color.withValues(alpha: opacity);
  static AppColor fromColor(_i1.Color color, [AppColor? orElse]) =>
      AppColor.values.firstWhere(
        (e) => e.color == color,
        orElse: orElse == null ? null : () => orElse,
      );
}
