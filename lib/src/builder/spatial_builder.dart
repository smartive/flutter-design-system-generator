import 'package:code_builder/code_builder.dart';

import '../config/config.dart';
import 'base_builder.dart';

final class SpatialBuilder extends DesignSystemBuilder {
  SpatialBuilder() : super('spatials');

  @override
  Library buildLibrary(DesignSystemConfig config) {
    if (config.colors.isEmpty) {
      return Library();
    }

    return Library((b) => b
      ..body.add(
        Class((b) => b
          ..name = 'AppSpatials'
          ..modifier = ClassModifier.final$
          ..abstract = true
          ..fields.addAll(config.spatials.map((s) => Field((b) => b
            ..name = s.validName
            ..static = true
            ..modifier = FieldModifier.constant
            ..docs.addAll(['/// ${s.validName} (${s.space}px)'])
            ..assignment = Code('${s.space}'))))),
      ));
  }
}
