import '../config/radius.dart';

String radiiGenerator(Iterable<DesignSystemBorderRadius> radii) =>
    '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Border Radii
// **************************************************************************

import 'package:flutter/widgets.dart';

${_class(radii)}
${_enum(radii)}''';

String _class(Iterable<DesignSystemBorderRadius> radii) => '''
final class AppBorderRadii {
  AppBorderRadii._();

${radii.map((e) => [
          '  /// ${e.validName} (${e.radius}px)',
          '  static const ${e.validName} = ${e.radius};'
        ].join('\n')).join('\n')}
}
''';

String _enum(Iterable<DesignSystemBorderRadius> radii) => '''
enum AppBorderRadius {
${radii.map((e) => [
          '  /// ${e.validName} (${e.radius}px)',
          '  ${e.validName}(AppBorderRadii.${e.validName})'
        ].join('\n')).join(',\n')};

  const AppBorderRadius(this.radius);

  final double radius;

  BorderRadius get all =>
      only(topLeft: true, topRight: true, bottomLeft: true, bottomRight: true);

  BorderRadius get bottom => only(bottomLeft: true, bottomRight: true);

  BorderRadius get left => only(topLeft: true, bottomLeft: true);

  BorderRadius get right => only(topRight: true, bottomRight: true);

  BorderRadius get top => only(topLeft: true, topRight: true);

  BorderRadius only(
          {bool topLeft = false,
          bool topRight = false,
          bool bottomLeft = false,
          bool bottomRight = false}) =>
      BorderRadius.only(
        topLeft: topLeft ? Radius.circular(radius) : Radius.zero,
        topRight: topRight ? Radius.circular(radius) : Radius.zero,
        bottomLeft: bottomLeft ? Radius.circular(radius) : Radius.zero,
        bottomRight: bottomRight ? Radius.circular(radius) : Radius.zero,
      );
}
''';
