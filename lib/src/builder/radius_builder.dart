import 'package:code_builder/code_builder.dart';

import '../config/config.dart';
import 'base_builder.dart';

/// A builder for generating border radius-related design system code.
///
/// This class extends [DesignSystemBuilder] and generates a Dart library
/// that defines border radii as constants and provides an enum for border radius references.
final class RadiusBuilder extends DesignSystemBuilder {
  /// Creates a [RadiusBuilder] instance.
  RadiusBuilder() : super('radii');

  @override
  Library buildLibrary(DesignSystemConfig config) {
    if (config.radii.isEmpty) {
      return Library();
    }

    final brRef = refer('BorderRadius', 'package:flutter/widgets.dart');
    final rRef = refer('Radius', 'package:flutter/widgets.dart');

    return Library(
      (b) => b
        ..body.add(
          Class(
            (b) => b
              ..name = 'AppBorderRadii'
              ..modifier = ClassModifier.final$
              ..abstract = true
              ..fields.addAll(
                config.radii.map(
                  (r) => Field(
                    (b) => b
                      ..name = r.validName
                      ..static = true
                      ..modifier = FieldModifier.constant
                      ..docs.addAll(['/// ${r.validName} (${r.radius}px)'])
                      ..assignment = Code('${r.radius}'),
                  ),
                ),
              ),
          ),
        )
        ..body.add(
          Enum(
            (b) => b
              ..name = 'AppBorderRadius'
              ..fields.add(
                Field(
                  (b) => b
                    ..modifier = FieldModifier.final$
                    ..name = 'radius'
                    ..type = refer('double'),
                ),
              )
              ..constructors.add(
                Constructor(
                  (b) => b
                    ..constant = true
                    ..requiredParameters.add(
                      Parameter(
                        (b) => b
                          ..name = 'radius'
                          ..toThis = true,
                      ),
                    ),
                ),
              )
              ..methods.add(
                Method(
                  (b) => b
                    ..name = 'asRadius'
                    ..type = MethodType.getter
                    ..returns = rRef
                    ..lambda = true
                    ..body = rRef.property('circular').call([
                      refer('radius'),
                    ]).code,
                ),
              )
              ..methods.add(
                Method(
                  (b) => b
                    ..name = 'all'
                    ..type = MethodType.getter
                    ..returns = brRef
                    ..lambda = true
                    ..body = Code(
                      'only(topLeft: true, topRight: true, bottomLeft: true, bottomRight: true)',
                    ),
                ),
              )
              ..methods.add(
                Method(
                  (b) => b
                    ..name = 'bottom'
                    ..type = MethodType.getter
                    ..returns = brRef
                    ..lambda = true
                    ..body = Code('only(bottomLeft: true, bottomRight: true)'),
                ),
              )
              ..methods.add(
                Method(
                  (b) => b
                    ..name = 'left'
                    ..type = MethodType.getter
                    ..returns = brRef
                    ..lambda = true
                    ..body = Code('only(topLeft: true, bottomLeft: true)'),
                ),
              )
              ..methods.add(
                Method(
                  (b) => b
                    ..name = 'right'
                    ..type = MethodType.getter
                    ..returns = brRef
                    ..lambda = true
                    ..body = Code('only(topRight: true, bottomRight: true)'),
                ),
              )
              ..methods.add(
                Method(
                  (b) => b
                    ..name = 'top'
                    ..type = MethodType.getter
                    ..returns = brRef
                    ..lambda = true
                    ..body = Code('only(topLeft: true, topRight: true)'),
                ),
              )
              ..methods.add(
                Method(
                  (b) => b
                    ..name = 'only'
                    ..returns = brRef
                    ..optionalParameters.addAll([
                      Parameter(
                        (b) => b
                          ..name = 'topLeft'
                          ..type = refer('bool')
                          ..named = true
                          ..defaultTo = literalFalse.code,
                      ),
                      Parameter(
                        (b) => b
                          ..name = 'topRight'
                          ..type = refer('bool')
                          ..named = true
                          ..defaultTo = literalFalse.code,
                      ),
                      Parameter(
                        (b) => b
                          ..name = 'bottomLeft'
                          ..type = refer('bool')
                          ..named = true
                          ..defaultTo = literalFalse.code,
                      ),
                      Parameter(
                        (b) => b
                          ..name = 'bottomRight'
                          ..type = refer('bool')
                          ..named = true
                          ..defaultTo = literalFalse.code,
                      ),
                    ])
                    ..lambda = true
                    ..body = brRef.property('only').call([], {
                      'topLeft': refer(
                        'topLeft',
                      ).conditional(refer('asRadius'), rRef.property('zero')),
                      'topRight': refer(
                        'topRight',
                      ).conditional(refer('asRadius'), rRef.property('zero')),
                      'bottomLeft': refer(
                        'bottomLeft',
                      ).conditional(refer('asRadius'), rRef.property('zero')),
                      'bottomRight': refer(
                        'bottomRight',
                      ).conditional(refer('asRadius'), rRef.property('zero')),
                    }).code,
                ),
              )
              ..methods.add(
                Method(
                  (b) => b
                    ..name = 'combine'
                    ..returns = brRef
                    ..optionalParameters.addAll([
                      Parameter(
                        (b) => b
                          ..name = 'topLeft'
                          ..type = refer('AppBorderRadius?')
                          ..named = true,
                      ),
                      Parameter(
                        (b) => b
                          ..name = 'topRight'
                          ..type = refer('AppBorderRadius?')
                          ..named = true,
                      ),
                      Parameter(
                        (b) => b
                          ..name = 'bottomLeft'
                          ..type = refer('AppBorderRadius?')
                          ..named = true,
                      ),
                      Parameter(
                        (b) => b
                          ..name = 'bottomRight'
                          ..type = refer('AppBorderRadius?')
                          ..named = true,
                      ),
                    ])
                    ..lambda = true
                    ..body = refer('all').property('copyWith').call([], {
                      'topLeft': refer('topLeft').nullSafeProperty('asRadius'),
                      'topRight': refer(
                        'topRight',
                      ).nullSafeProperty('asRadius'),
                      'bottomLeft': refer(
                        'bottomLeft',
                      ).nullSafeProperty('asRadius'),
                      'bottomRight': refer(
                        'bottomRight',
                      ).nullSafeProperty('asRadius'),
                    }).code,
                ),
              )
              ..values.addAll(
                config.radii.map(
                  (r) => EnumValue(
                    (b) => b
                      ..name = r.validName
                      ..docs.addAll(['/// ${r.validName} (${r.radius}px)'])
                      ..arguments.add(
                        refer('AppBorderRadii').property(r.validName),
                      ),
                  ),
                ),
              ),
          ),
        ),
    );
  }
}
