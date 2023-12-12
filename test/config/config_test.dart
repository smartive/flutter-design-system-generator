import 'package:design_system_generator/src/config/border_width.dart';
import 'package:design_system_generator/src/config/color.dart';
import 'package:design_system_generator/src/config/config.dart';
import 'package:design_system_generator/src/config/icon_size.dart';
import 'package:design_system_generator/src/config/radius.dart';
import 'package:design_system_generator/src/config/screen.dart';
import 'package:design_system_generator/src/config/spatial.dart';
import 'package:design_system_generator/src/config/typography.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DesignSystemConfig', () {
    test('should return empty if "false" is provided.', () {
      final config = DesignSystemConfig.fromJson({
        'colors': false,
        'screens': false,
        'spacings': false,
        'borderRadius': false,
        'typography': false,
      });

      expect(config.colors, isEmpty);
      expect(config.screens, isEmpty);
      expect(config.spatials, isEmpty);
      expect(config.radii, isEmpty);
      expect(config.typography, isEmpty);
    });

    test('should return default if value is omitted.', () {
      final config = DesignSystemConfig.fromJson({});

      expect(config.colors, DesignSystemColor.defaultValue);
      expect(config.screens, DesignSystemScreen.defaultValue);
      expect(config.spatials, DesignSystemSpatial.defaultValue);
      expect(config.borderWidths, DesignSystemBorderWidth.defaultValue);
      expect(config.radii, DesignSystemBorderRadius.defaultValue);
      expect(config.typography, DesignSystemTextStyle.defaultValue);
      expect(config.iconSizes, DesignSystemIconSize.defaultValue);
    });

    test('should correctly parse screens.', () {
      final config = DesignSystemConfig.fromJson({
        'screens': {'medium': 700, 'big': 1200},
      });

      expect(config.screens, [
        DesignSystemScreen('medium', 700),
        DesignSystemScreen('big', 1200),
      ]);
    });

    test('should correctly parse spacings.', () {
      final config = DesignSystemConfig.fromJson({
        'spacings': {'small': 4, 'medium': 8, 'large': 16},
      });

      expect(config.spatials, [
        DesignSystemSpatial('small', 4),
        DesignSystemSpatial('medium', 8),
        DesignSystemSpatial('large', 16),
      ]);
    });

    test('should correctly parse border widths.', () {
      final config = DesignSystemConfig.fromJson({
        'borderWidths': {'b1': 1, 'b2': 2},
      });

      expect(config.borderWidths, [
        DesignSystemBorderWidth('b1', 1),
        DesignSystemBorderWidth('b2', 2),
      ]);
    });

    test('should correctly parse border radii.', () {
      final config = DesignSystemConfig.fromJson({
        'borderRadius': {'small': 2, 'medium': 6, 'large': 8},
      });

      expect(config.radii, [
        DesignSystemBorderRadius('small', 2),
        DesignSystemBorderRadius('medium', 6),
        DesignSystemBorderRadius('large', 8),
      ]);
    });

    test('should correctly parse colors.', () {
      final config = DesignSystemConfig.fromJson({
        'colors': {
          'primary': '#000000',
          'secondary': '#FFFFFF',
          'accent': {'DEFAULT': '#FF0000', 'light': '#00FF00'},
        },
      });

      expect(config.colors, [
        DesignSystemColor('accent', '#FF0000'),
        DesignSystemColor('accentLight', '#00FF00'),
        DesignSystemColor('primary', '#000000'),
        DesignSystemColor('secondary', '#FFFFFF'),
      ]);
    });

    test('should correctly parse typography.', () {
      final config = DesignSystemConfig.fromJson({
        'typography': {
          'h': {
            '1': {
              'family': 'Roboto',
            },
            '2': {
              'family': 'Arial',
            },
          },
          'button': {
            'family': 'comic sans',
          },
        },
      });

      expect(config.typography, [
        DesignSystemTextStyle(
            'button', 'comic sans', null, null, null, null, null),
        DesignSystemTextStyle('h1', 'Roboto', null, null, null, null, null),
        DesignSystemTextStyle('h2', 'Arial', null, null, null, null, null),
      ]);
    });

    test('should correctly parse icon sizes.', () {
      final config = DesignSystemConfig.fromJson({
        'iconSizes': {'small': 16, 'medium': 20, 'large': 24},
      });

      expect(config.iconSizes, [
        DesignSystemIconSize('small', 16),
        DesignSystemIconSize('medium', 20),
        DesignSystemIconSize('large', 24),
      ]);
    });
  });
}
