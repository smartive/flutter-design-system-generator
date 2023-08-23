import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:design_system_generator/src/config/config.dart';

abstract base class DesignSystemBuilder implements Builder {
  final String part;

  DesignSystemBuilder(this.part);

  Library buildLibrary(DesignSystemConfig config);

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final output =
        buildStep.inputId.changeExtension('').changeExtension('.$part.dart');
    final configString = await buildStep.readAsString(buildStep.inputId);
    final config = DesignSystemConfig.fromJson(jsonDecode(configString));
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
        DartFormatter().format(outputLib
            .accept(DartEmitter.scoped(
                useNullSafetySyntax: true, orderDirectives: true))
            .toString()));
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        '.ds.json': ['.$part.dart'],
      };
}
