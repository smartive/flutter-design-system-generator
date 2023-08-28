import 'package:code_builder/code_builder.dart';

import '../config/config.dart';
import 'base_builder.dart';

final class ScreenBuilder extends DesignSystemBuilder {
  ScreenBuilder() : super('screens');

  @override
  Library buildLibrary(DesignSystemConfig config) {
    if (config.screens.isEmpty) {
      return Library();
    }

    return Library((b) => b
      ..body.add(
        Class((b) => b
          ..name = 'AppBreakpoints'
          ..modifier = ClassModifier.final$
          ..abstract = true
          ..fields.addAll(config.screens.map((s) => Field((b) => b
            ..name = s.validName
            ..static = true
            ..modifier = FieldModifier.constant
            ..docs.add(
                '/// ${s.validName} (${s.width}px) - media query width >= ${s.width}px')
            ..assignment = Code('${s.width}'))))),
      )
      ..body.add(Enum((b) => b
        ..name = 'AppBreakpoint'
        ..fields.add(Field((b) => b
          ..modifier = FieldModifier.final$
          ..name = 'width'
          ..type = refer('double')))
        ..constructors.add(Constructor((b) => b
          ..constant = true
          ..requiredParameters.add(Parameter((b) => b
            ..name = 'width'
            ..toThis = true))))
        ..methods.add(Method((b) => b
          ..name = 'integerWidth'
          ..type = MethodType.getter
          ..lambda = true
          ..returns = refer('int')
          ..body = Code('width.toInt()')))
        ..values.addAll(config.screens.map((s) => EnumValue((b) => b
          ..name = s.validName
          ..docs.add(
              '/// ${s.validName} (${s.width}px) - media query width >= ${s.width}px')
          ..arguments.add(refer('AppBreakpoints').property(s.validName)))))))
      ..body.add(Method((b) => b
        ..name = 'responsiveValue'
        ..types.add(refer('T'))
        ..returns = refer('T')
        ..docs.addAll([
          '/// Return a specific value based on the current window/view size.',
          '/// If a [context] is provided, `View.of(context)` determines the',
          '/// size, otherwise the platformDispatcher is used.',
          '///',
          '/// Returns the biggest possible value of the defined breakpoints.',
          '/// If the screen is smaller than the smallest breakpoint, [defaultValue]',
          '/// is returned.',
          '///',
          '/// Breakpoints:',
          ...config.screens.map((s) => '/// - ${s.validName} (${s.width}px)')
        ])
        ..requiredParameters.add(Parameter((b) => b
          ..name = 'defaultValue'
          ..type = refer('T')))
        ..optionalParameters.add(Parameter((b) => b
          ..name = 'context'
          ..type = refer('BuildContext?', 'package:flutter/widgets.dart')
          ..named = true))
        ..optionalParameters.addAll(config.screens.map((s) => Parameter((b) => b
          ..name = s.validName
          ..type = refer('T?')
          ..named = true)))
        ..body = Block.of([
          declareFinal('width')
              .assign(refer('context').notEqualTo(literalNull).conditional(
                  refer('View', 'package:flutter/widgets.dart')
                      .property('of')
                      .call([refer('context')])
                      .property('physicalSize')
                      .property('width'),
                  refer('WidgetsBinding', 'package:flutter/widgets.dart')
                      .property('instance')
                      .property('platformDispatcher')
                      .property('views')
                      .property('first')
                      .property('physicalSize')
                      .property('width')))
              .statement,
          declareFinal('values')
              .assign(literalMap({
                for (final e
                    in config.screens.toList()
                      ..sort((a, b) => b.width.compareTo(a.width)))
                  refer('AppBreakpoints').property(e.validName):
                      refer(e.validName)
              }))
              .statement,
          refer('values')
              .property('entries')
              .property('skipWhile')
              .call([CodeExpression(Code('(e) => e.key > width'))])
              .property('map')
              .call([CodeExpression(Code('(e) => e.value'))])
              .property('firstWhere')
              .call([
                CodeExpression(
                    Code('(e) => e != null, orElse: () => defaultValue'))
              ])
              .asA(refer('T'))
              .returned
              .statement,
        ]))));
  }
}
