import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

extension HexString on Color {
  String get hexString {
    final red = (r * 255).toInt().toRadixString(16).padLeft(2, '0');
    final green = (g * 255).toInt().toRadixString(16).padLeft(2, '0');
    final blue = (b * 255).toInt().toRadixString(16).padLeft(2, '0');
    final alpha = (a * 255).toInt().toRadixString(16).padLeft(2, '0');

    return '$alpha$red$green$blue';
  }
}

class AppColors {
  AppColors._();

  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const transparent = Color(0x00000000);
}

enum AppColor {
  black(AppColors.black),
  white(AppColors.white),
  transparent(AppColors.transparent);

  const AppColor(this.color);

  final Color color;

  Color withOpacity(double opacity) => color.withValues(alpha: opacity);

  static AppColor fromColor(Color color, [AppColor? orElse]) =>
      AppColor.values.firstWhere(
        (e) => e.color == color,
        orElse: orElse == null ? null : () => orElse,
      );
}

void main() {
  test('should return color with custom opacity', () async {
    expect(AppColor.white.color.hexString, 'ffffffff');
    expect(AppColor.white.withOpacity(0.5).hexString, '7fffffff');
  });

  test('should correctly return AppColor for color', () async {
    expect(AppColor.fromColor(Color(0xFFFFFFFF)).color.hexString, 'ffffffff');
  });

  test('should correctly return "orElse" if color not found', () async {
    expect(
      AppColor.fromColor(
        Color(0xFFaabbcc),
        AppColor.transparent,
      ).color.hexString,
      '00000000',
    );
  });

  test('should throw if no orElse is provided and no color is found', () async {
    expect(() => AppColor.fromColor(Color(0xFFaabbcc)), throwsStateError);
  });
}
