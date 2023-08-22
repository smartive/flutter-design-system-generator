import 'package:code_builder/code_builder.dart';

import '../config/config.dart';
import 'base_builder.dart';

final class ScreenBuilder extends DesignSystemBuilder {
  ScreenBuilder() : super('screens');

  @override
  Library buildLibrary(DesignSystemConfig config) {
    if (config.colors.isEmpty) {
      return Library();
    }

    return Library((b) => b
      ..body.add(
        Class((b) => b
          ..name = 'AppBreakpoints'
          ..modifier = ClassModifier.final$
          ..abstract = true
          ..fields.addAll(config.screens.map((s) => Field((b) => b
            ..name = s.validName
            ..static = true
            ..modifier = FieldModifier.constant
            ..docs.addAll([
              '/// ${s.validName} (${s.width}px) - media query width >= ${s.width}px'
            ])
            ..assignment = Code('${s.width}'))))),
      ));
  }
}
