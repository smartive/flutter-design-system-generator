import 'dart:convert';

import 'package:design_system_generator/src/config/config.dart';
import 'package:design_system_generator/src/generators/colors.dart';
import 'package:design_system_generator/src/generators/radii.dart';
import 'package:design_system_generator/src/generators/screens.dart';
import 'package:design_system_generator/src/generators/spatials.dart';
import 'package:flutter_test/flutter_test.dart';

part 'generators_test.data.dart';

void main() {
  group('BorderRadiusGenerator -', () {
    for (final testCase in _radiusTestCases) {
      test('should generate correct code (${testCase.name})', () {
        final input = testCase.input;
        final expectedOutput = testCase.output;

        final parsedConfig = DesignSystemConfig.fromJson(jsonDecode(input));
        final output = radiiGenerator(parsedConfig.radii);

        expect(output, expectedOutput);
      });
    }
  });

  group('ColorGenerator -', () {
    for (final testCase in _colorTestCases) {
      test('should generate correct code (${testCase.name})', () {
        final input = testCase.input;
        final expectedOutput = testCase.output;

        final parsedConfig = DesignSystemConfig.fromJson(jsonDecode(input));
        final output = colorGenerator(parsedConfig.colors);

        expect(output, expectedOutput);
      });
    }
  });

  group('ScreenGenerator -', () {
    for (final testCase in _screenTestCases) {
      test('should generate correct code (${testCase.name})', () {
        final input = testCase.input;
        final expectedOutput = testCase.output;

        final parsedConfig = DesignSystemConfig.fromJson(jsonDecode(input));
        final output = screenGenerator(parsedConfig.screens);

        expect(output, expectedOutput);
      });
    }
  });

  group('SpatialGenerator -', () {
    for (final testCase in _spatialTestCases) {
      test('should generate correct code (${testCase.name})', () {
        final input = testCase.input;
        final expectedOutput = testCase.output;

        final parsedConfig = DesignSystemConfig.fromJson(jsonDecode(input));
        final output = spatialGenerator(parsedConfig.spatials);

        expect(output, expectedOutput);
      });
    }
  });
}
