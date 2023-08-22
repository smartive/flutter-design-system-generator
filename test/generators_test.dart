import 'dart:convert';

import 'package:design_system_generator/src/old/config/config.dart';
import 'package:design_system_generator/src/old/generators/colors.dart';
import 'package:design_system_generator/src/old/generators/radii.dart';
import 'package:design_system_generator/src/old/generators/screens.dart';
import 'package:design_system_generator/src/old/generators/spatials.dart';
import 'package:design_system_generator/src/old/generators/typography.dart';
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

  group('TypographyGenerator -', () {
    for (final testCase in _typographyTestCases) {
      test('should generate correct code (${testCase.name})', () {
        final input = testCase.input;
        final expectedOutput = testCase.output;

        final parsedConfig = DesignSystemConfig.fromJson(jsonDecode(input));
        final output = typographyGenerator(parsedConfig.typography);

        expect(output, expectedOutput);
      });
    }
  });
}
