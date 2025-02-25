import 'package:code_builder/code_builder.dart';

import '../config/config.dart';
import 'base_builder.dart';

/// A builder for generating icon size-related design system code.
///
/// This class extends [DesignSystemBuilder] and generates a Dart library
/// that defines icon sizes as constants and provides an enum for icon size references.
final class IconSizeBuilder extends DesignSystemBuilder {
  /// Creates a [IconSizeBuilder] instance.
  IconSizeBuilder() : super('icon_sizes');

  @override
  Library buildLibrary(DesignSystemConfig config) {
    if (config.iconSizes.isEmpty) {
      return Library();
    }

    return Library((b) => b
      ..body.add(
        Class((b) => b
          ..name = 'AppIconSizes'
          ..modifier = ClassModifier.final$
          ..abstract = true
          ..fields.addAll(config.iconSizes.map((s) => Field((b) => b
            ..name = s.validName
            ..static = true
            ..modifier = FieldModifier.constant
            ..docs.addAll(['/// ${s.validName} (${s.size}px)'])
            ..assignment = Code('${s.size}'))))),
      )
      ..body.add(Enum((b) => b
        ..name = 'AppIconSize'
        ..fields.add(Field((b) => b
          ..modifier = FieldModifier.final$
          ..name = 'value'
          ..type = refer('double')))
        ..constructors.add(Constructor((b) => b
          ..constant = true
          ..requiredParameters.add(Parameter((b) => b
            ..name = 'value'
            ..toThis = true))))
        ..methods.add(Method((b) => b
          ..name = 'integer'
          ..type = MethodType.getter
          ..lambda = true
          ..returns = refer('int')
          ..body = Code('value.toInt()')))
        ..values.addAll(config.iconSizes.map((s) => EnumValue((b) => b
          ..name = s.validName
          ..docs.addAll(['/// ${s.validName} (${s.size}px)'])
          ..arguments.add(refer('AppIconSizes').property(s.validName))))))));
  }
}
