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

    final boxRef = refer('SizedBox', 'package:flutter/widgets.dart');
    final insetsRef = refer('EdgeInsets', 'package:flutter/widgets.dart');

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
      )
      ..body.add(Enum((b) => b
        ..name = 'AppSpatial'
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
        ..methods.add(Method((b) => b
          ..name = 'verticalSpacer'
          ..type = MethodType.getter
          ..lambda = true
          ..returns = boxRef
          ..body = boxRef.newInstance([], {'height': refer('value')}).code))
        ..methods.add(Method((b) => b
          ..name = 'horizontalSpacer'
          ..type = MethodType.getter
          ..lambda = true
          ..returns = boxRef
          ..body = boxRef.newInstance([], {'width': refer('value')}).code))
        ..methods.add(Method((b) => b
          ..name = 'insetsAll'
          ..type = MethodType.getter
          ..lambda = true
          ..returns = insetsRef
          ..body = insetsRef.newInstanceNamed('all', [refer('value')]).code))
        ..methods.add(Method((b) => b
          ..name = 'insetsHorizontal'
          ..type = MethodType.getter
          ..lambda = true
          ..returns = insetsRef
          ..body = insetsRef.newInstanceNamed(
              'symmetric', [], {'horizontal': refer('value')}).code))
        ..methods.add(Method((b) => b
          ..name = 'insetsVertical'
          ..type = MethodType.getter
          ..lambda = true
          ..returns = insetsRef
          ..body = insetsRef.newInstanceNamed(
              'symmetric', [], {'vertical': refer('value')}).code))
        ..methods.addAll(['top', 'bottom', 'left', 'right'].map((e) => Method(
            (b) => b
              ..name = 'insets${e[0].toUpperCase()}${e.substring(1)}'
              ..type = MethodType.getter
              ..lambda = true
              ..returns = insetsRef
              ..body = insetsRef
                  .newInstanceNamed('only', [], {e: refer('value')}).code)))
        ..methods.add(Method((b) => b
          ..name = 'only'
          ..returns = insetsRef
          ..optionalParameters.addAll([
            Parameter((b) => b
              ..name = 'left'
              ..type = refer('bool')
              ..named = true
              ..defaultTo = literalFalse.code),
            Parameter((b) => b
              ..name = 'top'
              ..type = refer('bool')
              ..named = true
              ..defaultTo = literalFalse.code),
            Parameter((b) => b
              ..name = 'right'
              ..type = refer('bool')
              ..named = true
              ..defaultTo = literalFalse.code),
            Parameter((b) => b
              ..name = 'bottom'
              ..type = refer('bool')
              ..named = true
              ..defaultTo = literalFalse.code),
          ])
          ..lambda = true
          ..body = insetsRef.newInstanceNamed('only', [], {
            'left': refer('left').conditional(refer('value'), literalNum(0)),
            'right': refer('right').conditional(refer('value'), literalNum(0)),
            'top': refer('top').conditional(refer('value'), literalNum(0)),
            'bottom':
                refer('bottom').conditional(refer('value'), literalNum(0)),
          }).code))
        ..methods.add(Method((b) => b
          ..name = 'combine'
          ..returns = insetsRef
          ..optionalParameters.addAll([
            Parameter((b) => b
              ..name = 'left'
              ..type = refer('AppSpatial?')
              ..named = true),
            Parameter((b) => b
              ..name = 'top'
              ..type = refer('AppSpatial?')
              ..named = true),
            Parameter((b) => b
              ..name = 'right'
              ..type = refer('AppSpatial?')
              ..named = true),
            Parameter((b) => b
              ..name = 'bottom'
              ..type = refer('AppSpatial?')
              ..named = true),
          ])
          ..lambda = true
          ..body = refer('insetsAll').property('copyWith').call([], {
            'left': refer('left').nullSafeProperty('value'),
            'top': refer('top').nullSafeProperty('value'),
            'right': refer('right').nullSafeProperty('value'),
            'bottom': refer('bottom').nullSafeProperty('value'),
          }).code))
        ..values.addAll(config.spatials.map((s) => EnumValue((b) => b
          ..name = s.validName
          ..docs.addAll(['/// ${s.validName} (${s.space}px)'])
          ..arguments.add(refer('AppSpatials').property(s.validName))))))));
  }
}
