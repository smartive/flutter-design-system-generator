import 'dart:ui';

import 'package:build_test/build_test.dart';
import 'package:design_system_generator/src/color_builder.dart';
import 'package:flutter_test/flutter_test.dart';

part 'color_builder_test.data.dart';

void main() {
  group('ColorBuilder -', () {
    group('Generator -', () {
      test('should not throw an exception',
          () => testBuilder(ColorBuilder(), _inputEmptyDesignSystem));

      test(
          'should generate default colors if none provided',
          () => testBuilder(ColorBuilder(), _inputEmptyDesignSystem,
              outputs: _outputDefaultColors));

      test(
          'should generate custom colors if provided',
          () => testBuilder(ColorBuilder(), _inputValidColors,
              outputs: _outputValidColors));

      test(
          'should generate namespaced colors',
          () => testBuilder(ColorBuilder(), _inputNamespacedColors,
              outputs: _outputNamespacedColors));

      test(
          'should remove "DEFAULT" suffix in color names',
          () => testBuilder(ColorBuilder(), _inputNamespacedColorsWithDefault,
              outputs: _outputNamespacedColorsWithDefault));

      test(
          'should create valid names for invalid color names',
          () => testBuilder(ColorBuilder(), _inputInvalidColorNames,
              outputs: _outputInvalidColorNames));

      test(
          'should return default for invalid color hex values',
          () => testBuilder(ColorBuilder(), _inputInvalidColorValues,
              outputs: _outputInvalidColorValues));

      test(
          'should provide FF (255) as alpha channel if none provided',
          () => testBuilder(ColorBuilder(), _inputAlphaChannels,
              outputs: _outputAlphaChannels));
    });

    group('Generated Code -', () {
      test('should return color with custom opacity', () async {
        expect(AppColor.white.color.value.toRadixString(16), 'ffffffff');
        expect(AppColor.white.withOpacity(0.5).value.toRadixString(16),
            '80ffffff');
      });

      test('should correctly return AppColor for color', () async {
        expect(
            AppColor.fromColor(Color(0xFFFFFFFF)).color.value.toRadixString(16),
            'ffffffff');
      });

      test('should correctly return "orElse" if color not found', () async {
        expect(
            AppColor.fromColor(Color(0xFFaabbcc), AppColor.transparent)
                .color
                .value
                .toRadixString(16),
            '0');
      });

      test('should throw if no orElse is provided and no color is found',
          () async {
        expect(() => AppColor.fromColor(Color(0xFFaabbcc)), throwsStateError);
      });
    });
  });
}
