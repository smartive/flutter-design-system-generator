import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import '../config/config.dart';

/// Abstract base class for generating design system-related Dart files.
///
/// This class implements the [Builder] interface and is responsible for
/// generating Dart source files from a JSON-based configuration.
abstract base class DesignSystemBuilder implements Builder {
  /// The file extension part for the generated Dart file.
  final String part;

  /// Creates a [DesignSystemBuilder] with the specified [part].
  DesignSystemBuilder(this.part);

  /// Builds a [Library] representation based on the given [config].
  ///
  /// This method should be implemented by subclasses to define how
  /// the Dart library should be constructed from the provided
  /// [DesignSystemConfig].
  Library buildLibrary(DesignSystemConfig config);

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final designSystemName = buildStep.inputId.pathSegments.last
        .replaceFirst('.design-system.json', '');
    final output =
        buildStep.inputId.changeExtension('').changeExtension('.$part.dart');
    final configString = await buildStep.readAsString(buildStep.inputId);
    final config =
        DesignSystemConfig.fromJson(jsonDecode(configString), designSystemName);
    final outputLib = buildLibrary(config).rebuild((b) => b
      ..comments.addAll([
        'GENERATED CODE - DO NOT MODIFY BY HAND',
        '',
        '**************************************************************************',
        'Design System Generator - $part',
        '*************************************************************************',
      ]));

    if (outputLib.body.isEmpty) {
      return;
    }

    buildStep.writeAsString(
        output,
        DartFormatter(languageVersion: DartFormatter.latestLanguageVersion)
            .format(outputLib
                .accept(DartEmitter.scoped(
                    useNullSafetySyntax: true, orderDirectives: true))
                .toString()));
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        '.design-system.json': ['.$part.dart'],
      };
}
