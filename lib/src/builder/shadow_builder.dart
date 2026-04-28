import 'package:code_builder/code_builder.dart';

import '../config/config.dart';
import 'base_builder.dart';

/// A builder that generates shadow-related design system code.
final class ShadowBuilder extends DesignSystemBuilder {
  /// Creates a [ShadowBuilder] instance.
  ShadowBuilder() : super('shadows');

  @override
  Library buildLibrary(DesignSystemConfig config) {
    if (config.shadows.isEmpty) {
      return Library();
    }

    final boxShadowRef = refer('BoxShadow', 'package:flutter/widgets.dart');
    final offsetRef = refer('Offset', 'package:flutter/widgets.dart');
    final colorRef = refer('AppColor', './${config.name}.colors.dart');

    return Library(
      (b) => b
        ..body.add(
          Class(
            (b) => b
              ..name = 'AppShadows'
              ..modifier = ClassModifier.final$
              ..abstract = true
              ..methods.addAll(
                config.shadows.map(
                  (shadow) => Method(
                    (b) => b
                      ..name = shadow.validName
                      ..static = true
                      ..returns = boxShadowRef
                      ..docs.addAll([
                        '/// ${shadow.validName} (blur: ${shadow.blurRadius}px, spread: ${shadow.spreadRadius}px, offset: ${shadow.offsetDx}/${shadow.offsetDy})',
                      ])
                      ..optionalParameters.add(
                        Parameter(
                          (b) => b
                            ..name = 'color'
                            ..type = colorRef
                            ..named = true
                            ..defaultTo = colorRef.property('black').code,
                        ),
                      )
                      ..lambda = true
                      ..body = refer('AppShadow')
                          .property(shadow.validName)
                          .property('boxShadow')
                          .call([], {'color': refer('color')})
                          .code,
                  ),
                ),
              ),
          ),
        )
        ..body.add(
          Enum(
            (b) => b
              ..name = 'AppShadow'
              ..fields.addAll([
                Field(
                  (b) => b
                    ..modifier = FieldModifier.final$
                    ..name = 'blurRadius'
                    ..type = refer('double'),
                ),
                Field(
                  (b) => b
                    ..modifier = FieldModifier.final$
                    ..name = 'spreadRadius'
                    ..type = refer('double'),
                ),
                Field(
                  (b) => b
                    ..modifier = FieldModifier.final$
                    ..name = 'offset'
                    ..type = offsetRef,
                ),
              ])
              ..constructors.add(
                Constructor(
                  (b) => b
                    ..constant = true
                    ..requiredParameters.addAll([
                      Parameter(
                        (b) => b
                          ..name = 'blurRadius'
                          ..toThis = true,
                      ),
                      Parameter(
                        (b) => b
                          ..name = 'spreadRadius'
                          ..toThis = true,
                      ),
                      Parameter(
                        (b) => b
                          ..name = 'offset'
                          ..toThis = true,
                      ),
                    ]),
                ),
              )
              ..methods.add(
                Method(
                  (b) => b
                    ..name = 'boxShadow'
                    ..returns = boxShadowRef
                    ..optionalParameters.add(
                      Parameter(
                        (b) => b
                          ..name = 'color'
                          ..type = colorRef
                          ..named = true
                          ..defaultTo = colorRef.property('black').code,
                      ),
                    )
                    ..lambda = true
                    ..body = boxShadowRef.newInstance([], {
                      'color': refer('color').property('color'),
                      'blurRadius': refer('blurRadius'),
                      'spreadRadius': refer('spreadRadius'),
                      'offset': refer('offset'),
                    }).code,
                ),
              )
              ..methods.add(
                Method(
                  (b) => b
                    ..name = 'asList'
                    ..returns = TypeReference(
                      (b) => b
                        ..symbol = 'List'
                        ..types.add(boxShadowRef),
                    )
                    ..optionalParameters.add(
                      Parameter(
                        (b) => b
                          ..name = 'color'
                          ..type = colorRef
                          ..named = true
                          ..defaultTo = colorRef.property('black').code,
                      ),
                    )
                    ..lambda = true
                    ..body = literalList([
                      refer('boxShadow').call([], {'color': refer('color')}),
                    ]).code,
                ),
              )
              ..values.addAll(
                config.shadows.map(
                  (shadow) => EnumValue(
                    (b) => b
                      ..name = shadow.validName
                      ..docs.addAll([
                        '/// ${shadow.validName} (blur: ${shadow.blurRadius}px, spread: ${shadow.spreadRadius}px, offset: ${shadow.offsetDx}/${shadow.offsetDy})',
                      ])
                      ..arguments.addAll([
                        literalNum(shadow.blurRadius),
                        literalNum(shadow.spreadRadius),
                        offsetRef.newInstance([
                          literalNum(shadow.offsetDx),
                          literalNum(shadow.offsetDy),
                        ]),
                      ]),
                  ),
                ),
              ),
          ),
        ),
    );
  }
}
