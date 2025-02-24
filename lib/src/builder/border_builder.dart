import 'package:code_builder/code_builder.dart';

import '../config/config.dart';
import 'base_builder.dart';

/// A builder that generates border-related util functions.
final class BorderBuilder extends DesignSystemBuilder {
  /// Creates a [BorderBuilder] instance.
  BorderBuilder() : super('borders');

  @override
  Library buildLibrary(DesignSystemConfig config) {
    if (config.borderWidths.isEmpty) {
      return Library();
    }

    final borderRef = refer('Border', 'package:flutter/widgets.dart');
    final borderSideRef = refer('BorderSide', 'package:flutter/widgets.dart');
    final colorRef = refer('AppColor', './${config.name}.colors.dart');
    final borderWidthRef =
        refer('AppBorderWidth', './${config.name}.border_widths.dart');
    final borderWidthRefNullable =
        refer('AppBorderWidth?', './${config.name}.border_widths.dart');

    return Library((b) => b
      ..body.add(
        Class((b) => b
          ..name = 'AppBorders'
          ..modifier = ClassModifier.final$
          ..abstract = true
          ..methods.addAll([
            Method((b) => b
              ..name = 'all'
              ..static = true
              ..returns = borderRef
              ..requiredParameters.add(Parameter((b) => b
                ..name = 'width'
                ..type = borderWidthRef))
              ..optionalParameters.add(Parameter((b) => b
                ..name = 'color'
                ..type = colorRef
                ..named = true
                ..defaultTo = colorRef.property('black').code))
              ..body = borderRef.property('all').call([], {
                'width': refer('width').property('width'),
                'color': refer('color').property('color')
              }).code),
            Method((b) => b
              ..name = 'symmetric'
              ..static = true
              ..returns = borderRef
              ..optionalParameters.addAll([
                Parameter((b) => b
                  ..name = 'horizontal'
                  ..type = borderWidthRefNullable
                  ..named = true),
                Parameter((b) => b
                  ..name = 'vertical'
                  ..type = borderWidthRefNullable
                  ..named = true),
                Parameter((b) => b
                  ..name = 'color'
                  ..type = colorRef
                  ..named = true
                  ..defaultTo = colorRef.property('black').code),
              ])
              ..body = borderRef.property('symmetric').call([], {
                'horizontal':
                    refer('horizontal').notEqualTo(literalNull).conditional(
                        borderSideRef.newInstance([], {
                          'width': refer('horizontal').property('width'),
                          'color': refer('color').property('color')
                        }),
                        borderSideRef.property('none')),
                'vertical':
                    refer('vertical').notEqualTo(literalNull).conditional(
                        borderSideRef.newInstance([], {
                          'width': refer('vertical').property('width'),
                          'color': refer('color').property('color')
                        }),
                        borderSideRef.property('none')),
              }).code),
            Method((b) => b
              ..name = 'only'
              ..static = true
              ..returns = borderRef
              ..optionalParameters.addAll([
                Parameter((b) => b
                  ..name = 'top'
                  ..type = borderWidthRefNullable
                  ..named = true),
                Parameter((b) => b
                  ..name = 'right'
                  ..type = borderWidthRefNullable
                  ..named = true),
                Parameter((b) => b
                  ..name = 'bottom'
                  ..type = borderWidthRefNullable
                  ..named = true),
                Parameter((b) => b
                  ..name = 'left'
                  ..type = borderWidthRefNullable
                  ..named = true),
                Parameter((b) => b
                  ..name = 'color'
                  ..type = colorRef
                  ..named = true
                  ..defaultTo = colorRef.property('black').code),
              ])
              ..body = borderRef.call([], {
                'top': refer('top').notEqualTo(literalNull).conditional(
                    borderSideRef.newInstance([], {
                      'width': refer('top').property('width'),
                      'color': refer('color').property('color')
                    }),
                    borderSideRef.property('none')),
                'right': refer('right').notEqualTo(literalNull).conditional(
                    borderSideRef.newInstance([], {
                      'width': refer('right').property('width'),
                      'color': refer('color').property('color')
                    }),
                    borderSideRef.property('none')),
                'bottom': refer('bottom').notEqualTo(literalNull).conditional(
                    borderSideRef.newInstance([], {
                      'width': refer('bottom').property('width'),
                      'color': refer('color').property('color')
                    }),
                    borderSideRef.property('none')),
                'left': refer('left').notEqualTo(literalNull).conditional(
                    borderSideRef.newInstance([], {
                      'width': refer('left').property('width'),
                      'color': refer('color').property('color')
                    }),
                    borderSideRef.property('none')),
              }).code),
            Method((b) => b
              ..name = 'none'
              ..static = true
              ..returns = borderRef
              ..lambda = true
              ..body = borderRef
                  .property('fromBorderSide')
                  .call([borderSideRef.property('none')]).code),
          ])),
      ));
  }
}
