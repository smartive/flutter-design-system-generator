import 'package:code_builder/code_builder.dart';

import '../config/config.dart';
import 'base_builder.dart';

final class ColorBuilder extends DesignSystemBuilder {
  ColorBuilder() : super('colors');

  @override
  Library buildLibrary(DesignSystemConfig config) {
    if (config.colors.isEmpty) {
      return Library();
    }

    final colorRef = refer('Color', 'dart:ui');

    return Library((b) => b
      ..body.add(
        Class((b) => b
          ..name = 'AppColors'
          ..modifier = ClassModifier.final$
          ..abstract = true
          ..fields.addAll(config.colors.map((c) => Field((b) => b
            ..name = c.validName
            ..static = true
            ..modifier = FieldModifier.constant
            ..docs.addAll([
              if (!c.isValid)
                '/// ${c.validName} contains a non-valid 6 or 8 char hex string ("${c.hex}").'
            ])
            ..assignment = colorRef.newInstance(
                [CodeExpression(Code('0x${c.colorHex}'))]).code)))),
      )
      ..body.add(Enum((b) => b
        ..name = 'AppColor'
        ..fields.add(Field((b) => b
          ..modifier = FieldModifier.final$
          ..name = 'color'
          ..type = colorRef))
        ..constructors.add(Constructor((b) => b
          ..constant = true
          ..requiredParameters.add(Parameter((b) => b
            ..name = 'color'
            ..toThis = true))))
        ..methods.add(Method((b) => b
          ..name = 'withOpacity'
          ..returns = colorRef
          ..requiredParameters.add(Parameter((b) => b
            ..name = 'opacity'
            ..type = refer('double')))
          ..lambda = true
          ..body = Code('color.withValues(alpha: opacity)')))
        ..methods.add(Method((b) => b
          ..name = 'fromColor'
          ..static = true
          ..returns = refer('AppColor')
          ..requiredParameters.add(Parameter((b) => b
            ..name = 'color'
            ..type = colorRef))
          ..optionalParameters.add(Parameter((b) => b
            ..name = 'orElse'
            ..type = refer('AppColor?')))
          ..lambda = true
          ..body = Code(
              'AppColor.values.firstWhere((e) => e.color == color, orElse: orElse == null ? null : () => orElse)')))
        ..values.addAll(config.colors.map((c) => EnumValue((b) => b
          ..name = c.validName
          ..arguments.add(refer('AppColors').property(c.validName))))))));
  }
}
