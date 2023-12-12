import 'package:code_builder/code_builder.dart';

import '../config/config.dart';
import 'base_builder.dart';

final class BorderWidthBuilder extends DesignSystemBuilder {
  BorderWidthBuilder() : super('border_widths');

  @override
  Library buildLibrary(DesignSystemConfig config) {
    if (config.borderWidths.isEmpty) {
      return Library();
    }

    return Library((b) => b
      ..body.add(
        Class((b) => b
          ..name = 'AppBorderWidths'
          ..modifier = ClassModifier.final$
          ..abstract = true
          ..fields.addAll(config.borderWidths.map((bw) => Field((b) => b
            ..name = bw.validName
            ..static = true
            ..modifier = FieldModifier.constant
            ..docs.addAll(['/// ${bw.validName} (${bw.width}px)'])
            ..assignment = Code('${bw.width}'))))),
      )
      ..body.add(Enum((b) => b
        ..name = 'AppBorderWidth'
        ..fields.add(Field((b) => b
          ..modifier = FieldModifier.final$
          ..name = 'width'
          ..type = refer('double')))
        ..constructors.add(Constructor((b) => b
          ..constant = true
          ..requiredParameters.add(Parameter((b) => b
            ..name = 'width'
            ..toThis = true))))
        ..values.addAll(config.borderWidths.map((bw) => EnumValue((b) => b
          ..name = bw.validName
          ..docs.addAll(['/// ${bw.validName} (${bw.width}px)'])
          ..arguments
              .add(refer('AppBorderWidths').property(bw.validName))))))));
  }
}
