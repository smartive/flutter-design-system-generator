import 'border_width.dart';
import 'color.dart';
import 'icon_size.dart';
import 'radius.dart';
import 'screen.dart';
import 'spatial.dart';
import 'typography.dart';

/// Represents the configuration of the design system.
class DesignSystemConfig {
  /// Name of the design system.
  final String name;

  /// The list of colors in the design system.
  final List<DesignSystemColor> colors;

  /// The list of screen sizes in the design system.
  final List<DesignSystemScreen> screens;

  /// The list of spatial values in the design system.
  final List<DesignSystemSpatial> spatials;

  /// The list of border widths in the design system.
  final List<DesignSystemBorderWidth> borderWidths;

  /// The list of border radii in the design system.
  final List<DesignSystemBorderRadius> radii;

  /// The list of text styles in the design system.
  final List<DesignSystemTextStyle> typography;

  /// The list of icon sizes in the design system.
  final List<DesignSystemIconSize> iconSizes;

  /// Creates a [DesignSystemConfig] instance.
  const DesignSystemConfig._({
    required this.name,
    required this.colors,
    required this.screens,
    required this.spatials,
    required this.borderWidths,
    required this.radii,
    required this.typography,
    required this.iconSizes,
  });

  /// Creates a [DesignSystemConfig] instance from a JSON map.
  factory DesignSystemConfig.fromJson(Map<String, dynamic> json, String name) =>
      DesignSystemConfig._(
        name: name,
        colors: switch (json['colors']) {
          bool() => [],
          null => DesignSystemColor.defaultValue,
          final dynamic data => (DesignSystemColor.parse(
            data,
          ).toList(growable: false)..sort((a, b) => a.name.compareTo(b.name))),
        },
        screens: switch (json['screens']) {
          bool() => [],
          null => DesignSystemScreen.defaultValue,
          final dynamic data => DesignSystemScreen.parse(
            data,
          ).toList(growable: false)..sort((a, b) => a.width.compareTo(a.width)),
        },
        spatials: switch (json['spacings']) {
          bool() => [],
          null => DesignSystemSpatial.defaultValue,
          final dynamic data => (DesignSystemSpatial.parse(data).toList(
            growable: false,
          )..sort((a, b) => a.space.compareTo(b.space))),
        },
        borderWidths: switch (json['borderWidths']) {
          null => DesignSystemBorderWidth.defaultValue,
          final dynamic data => (DesignSystemBorderWidth.parse(data).toList(
            growable: false,
          )..sort((a, b) => a.width.compareTo(b.width))),
        },
        radii: switch (json['borderRadius']) {
          bool() => [],
          null => DesignSystemBorderRadius.defaultValue,
          final dynamic data => (DesignSystemBorderRadius.parse(data).toList(
            growable: false,
          )..sort((a, b) => a.radius.compareTo(b.radius))),
        },
        typography: switch (json['typography']) {
          bool() => [],
          null => DesignSystemTextStyle.defaultValue,
          final dynamic data => (DesignSystemTextStyle.parse(
            data,
          ).toList(growable: false)..sort((a, b) => a.name.compareTo(b.name))),
        },
        iconSizes: switch (json['iconSizes']) {
          null => DesignSystemIconSize.defaultValue,
          final dynamic data => (DesignSystemIconSize.parse(
            data,
          ).toList(growable: false)..sort((a, b) => a.size.compareTo(b.size))),
        },
      );
}
