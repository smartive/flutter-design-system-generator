import 'dart:io';

import 'package:path/path.dart' as path;

import 'color.dart';
import 'radius.dart';
import 'screen.dart';
import 'spatial.dart';
import 'typography.dart';

const _defaultPath = 'lib/ui/identity';
const _defaultColorsFile = 'colors.g.dart';
const _defaultScreensFile = 'screens.g.dart';
const _defaultRadiiFile = 'border_radii.g.dart';
const _defaultSpatialsFile = 'spatials.g.dart';
const _defaultTypoFile = 'typography.g.dart';

class DesignSystemConfig {
  final List<DesignSystemColor> colors;
  final List<DesignSystemScreen> screens;
  final List<DesignSystemSpatial> spatials;
  final List<DesignSystemBorderRadius> radii;
  final List<DesignSystemTextStyle> typography;

  final File colorsFile;
  final File radiiFile;
  final File screensFile;
  final File spatialsFile;
  final File typoFile;

  List<File> get files => [
        colorsFile,
        radiiFile,
        screensFile,
        spatialsFile,
      ];

  const DesignSystemConfig._({
    required this.colors,
    required this.screens,
    required this.spatials,
    required this.radii,
    required this.typography,
    required this.colorsFile,
    required this.radiiFile,
    required this.screensFile,
    required this.spatialsFile,
    required this.typoFile,
  });

  factory DesignSystemConfig.fromJson(Map<String, dynamic> json) {
    final basePath = json['output']?['basePath'] ?? _defaultPath;

    return DesignSystemConfig._(
      colors: json.containsKey('colors')
          ? json['colors'] is bool
              ? List.empty()
              : (DesignSystemColor.parse(json['colors']).toList(growable: false)
                ..sort(
                  (a, b) => a.name.compareTo(b.name),
                ))
          : DesignSystemColor.defaultValue,
      screens: json.containsKey('screens')
          ? json['screens'] is bool
              ? List.empty()
              : DesignSystemScreen.parse(json['screens'])
                  .toList(growable: false)
          : DesignSystemScreen.defaultValue,
      spatials: json.containsKey('spacings')
          ? json['spacings'] is bool
              ? List.empty()
              : DesignSystemSpatial.parse(json['spacings'])
                  .toList(growable: false)
          : DesignSystemSpatial.defaultValue,
      radii: json.containsKey('borderRadius')
          ? json['borderRadius'] is bool
              ? List.empty()
              : DesignSystemBorderRadius.parse(json['borderRadius'])
                  .toList(growable: false)
          : DesignSystemBorderRadius.defaultValue,
      typography: json.containsKey('typography')
          ? json['typography'] is bool
              ? List.empty()
              : DesignSystemTextStyle.parse(json['typography'])
                  .toList(growable: false)
          : DesignSystemTextStyle.defaultValue,
      colorsFile: File(path.join(
          basePath, json['output']?['colorFile'] ?? _defaultColorsFile)),
      radiiFile: File(path.join(
          basePath, json['output']?['radiiFile'] ?? _defaultRadiiFile)),
      screensFile: File(path.join(
          basePath, json['output']?['screenFile'] ?? _defaultScreensFile)),
      spatialsFile: File(path.join(
          basePath, json['output']?['spacingFile'] ?? _defaultSpatialsFile)),
      typoFile: File(
          path.join(basePath, json['output']?['typoFile'] ?? _defaultTypoFile)),
    );
  }
}
