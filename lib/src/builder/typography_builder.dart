import 'package:code_builder/code_builder.dart';

import '../config/config.dart';
import 'base_builder.dart';

final class TypographyBuilder extends DesignSystemBuilder {
  TypographyBuilder() : super('typography');

  @override
  Library buildLibrary(DesignSystemConfig config) {
    if (config.typography.isEmpty) {
      return Library();
    }

    final textStyleRef = refer('TextStyle', 'package:flutter/widgets.dart');
    final weightRef = refer('FontWeight', 'package:flutter/widgets.dart');

    return Library((b) => b
      ..body.add(
        Class((b) => b
          ..name = 'AppTypographies'
          ..modifier = ClassModifier.final$
          ..abstract = true
          ..fields.addAll(config.typography.map((t) => Field((b) => b
            ..name = t.validName
            ..static = true
            ..modifier = FieldModifier.constant
            ..docs.addAll(['/// Text Style Definition ${t.validName}'])
            ..assignment = textStyleRef.newInstance([], {
              'fontFamily':
                  t.family != null ? literalString(t.family!) : literalNull,
              'fontWeight': t.weight != null
                  ? weightRef.property('w${t.weight}')
                  : literalNull,
              'fontSize': t.size != null ? literalNum(t.size!) : literalNull,
              'height': t.lineHeight != null && t.size != null
                  ? literalNum(t.lineHeight! / t.size!)
                  : literalNull,
              'letterSpacing': t.letterSpacing != null
                  ? literalNum(t.letterSpacing!)
                  : literalNull,
              'wordSpacing': t.wordSpacing != null
                  ? literalNum(t.wordSpacing!)
                  : literalNull,
            }).code)))),
      )
      ..body.add(Enum((b) => b
        ..name = 'AppTypography'
        ..fields.add(Field((b) => b
          ..modifier = FieldModifier.final$
          ..name = 'textStyle'
          ..type = textStyleRef))
        ..constructors.add(Constructor((b) => b
          ..constant = true
          ..requiredParameters.add(Parameter((b) => b
            ..name = 'textStyle'
            ..toThis = true))))
        ..values.addAll(config.typography.map((t) => EnumValue((b) => b
          ..name = t.validName
          ..docs.addAll(['/// ${t.validName}'])
          ..arguments.add(refer('AppTypographies').property(t.validName))))))));
  }
}
