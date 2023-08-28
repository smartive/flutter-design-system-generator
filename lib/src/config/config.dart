import 'color.dart';
import 'radius.dart';
import 'screen.dart';
import 'spatial.dart';
import 'typography.dart';

class DesignSystemConfig {
  final List<DesignSystemColor> colors;
  final List<DesignSystemScreen> screens;
  final List<DesignSystemSpatial> spatials;
  final List<DesignSystemBorderRadius> radii;
  final List<DesignSystemTextStyle> typography;

  const DesignSystemConfig._({
    required this.colors,
    required this.screens,
    required this.spatials,
    required this.radii,
    required this.typography,
  });

  factory DesignSystemConfig.fromJson(Map<String, dynamic> json) =>
      DesignSystemConfig._(
        colors: switch (json['colors']) {
          bool() => [],
          null => DesignSystemColor.defaultValue,
          final dynamic data => (DesignSystemColor.parse(data).toList(growable: false)
            ..sort(
              (a, b) => a.name.compareTo(b.name),
            )),
        },
        screens: switch (json['screens']) {
          bool() => [],
          null => DesignSystemScreen.defaultValue,
          final dynamic data => DesignSystemScreen.parse(data).toList(growable: false)
            ..sort((a, b) => a.width.compareTo(a.width)),
        },
        spatials: switch (json['spacings']) {
          bool() => [],
          null => DesignSystemSpatial.defaultValue,
          final dynamic data =>
            (DesignSystemSpatial.parse(data).toList(growable: false)
              ..sort(
                (a, b) => a.space.compareTo(b.space),
              )),
        },
        radii: switch (json['borderRadius']) {
          bool() => [],
          null => DesignSystemBorderRadius.defaultValue,
          final dynamic data =>
            (DesignSystemBorderRadius.parse(data).toList(growable: false)
              ..sort(
                (a, b) => a.radius.compareTo(b.radius),
              )),
        },
        typography: switch (json['typography']) {
          bool() => [],
          null => DesignSystemTextStyle.defaultValue,
          final dynamic data =>
            (DesignSystemTextStyle.parse(data).toList(growable: false)
              ..sort(
                (a, b) => a.name.compareTo(b.name),
              )),
        },
      );
}
