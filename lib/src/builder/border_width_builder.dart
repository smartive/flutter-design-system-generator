import 'package:code_builder/code_builder.dart';

import '../config/config.dart';
import 'base_builder.dart';

/// A builder for generating border width-related design system code.
///
/// This class extends [DesignSystemBuilder] and generates a Dart library
/// that defines border widths as constants and provides an enum for border width references.
final class BorderWidthBuilder extends DesignSystemBuilder {
  /// Creates a [BorderWidthBuilder] instance.
  BorderWidthBuilder() : super('border_widths');

  @override
  Library buildLibrary(DesignSystemConfig config) {
    if (config.borderWidths.isEmpty) {
      return Library();
    }

    return Library(
      (b) => b
        ..body.add(
          Class(
            (b) => b
              ..name = 'AppBorderWidths'
              ..modifier = ClassModifier.final$
              ..abstract = true
              ..fields.addAll(
                config.borderWidths.map(
                  (bw) => Field(
                    (b) => b
                      ..name = bw.validName
                      ..static = true
                      ..modifier = FieldModifier.constant
                      ..docs.addAll(['/// ${bw.validName} (${bw.width}px)'])
                      ..assignment = Code('${bw.width}'),
                  ),
                ),
              ),
          ),
        )
        ..body.add(
          Enum(
            (b) => b
              ..name = 'AppBorderWidth'
              ..fields.add(
                Field(
                  (b) => b
                    ..modifier = FieldModifier.final$
                    ..name = 'width'
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
                          ..name = 'width'
                          ..toThis = true,
                      ),
                    ),
                ),
              )
              ..values.addAll(
                config.borderWidths.map(
                  (bw) => EnumValue(
                    (b) => b
                      ..name = bw.validName
                      ..docs.addAll(['/// ${bw.validName} (${bw.width}px)'])
                      ..arguments.add(
                        refer('AppBorderWidths').property(bw.validName),
                      ),
                  ),
                ),
              ),
          ),
        ),
    );
  }
}
