import 'package:code_builder/code_builder.dart';

import '../config/config.dart';
import 'base_builder.dart';

final class RadiusBuilder extends DesignSystemBuilder {
  RadiusBuilder() : super('radii');

  @override
  Library buildLibrary(DesignSystemConfig config) {
    if (config.colors.isEmpty) {
      return Library();
    }

    return Library((b) => b
      ..body.add(
        Class((b) => b
          ..name = 'AppBorderRadii'
          ..modifier = ClassModifier.final$
          ..abstract = true
          ..fields.addAll(config.radii.map((r) => Field((b) => b
            ..name = r.validName
            ..static = true
            ..modifier = FieldModifier.constant
            ..docs.addAll(['/// ${r.validName} (${r.radius}px)'])
            ..assignment = Code('${r.radius}'))))),
      ));
  }
}
