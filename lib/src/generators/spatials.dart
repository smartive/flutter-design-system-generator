import '../config/spatial.dart';

String spatialGenerator(Iterable<DesignSystemSpatial> spatials) =>
    '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Spatials
// **************************************************************************

import 'package:flutter/widgets.dart';

${_class(spatials)}
${_enum(spatials)}''';

String _class(Iterable<DesignSystemSpatial> spatials) => '''
final class AppSpatials {
  AppSpatials._();

${spatials.map((e) => [
          '  /// ${e.validName} (${e.space}px)',
          '  static const ${e.validName} = ${e.space};'
        ].join('\n')).join('\n')}
}
''';

String _enum(Iterable<DesignSystemSpatial> spatials) => '''
enum AppSpatial {
${spatials.map((e) => [
          '  /// ${e.validName} (${e.space}px)',
          '  ${e.validName}(AppSpatials.${e.validName})'
        ].join('\n')).join(',\n')};

  const AppSpatial(this.value);

  final double value;

  int get integer => value.toInt();

  SizedBox get verticalSpacer => SizedBox(height: value);

  SizedBox get horizontalSpacer => SizedBox(width: value);

  EdgeInsets get insetsAll => EdgeInsets.all(value);

  EdgeInsets get insetsHorizontal => EdgeInsets.symmetric(horizontal: value);

  EdgeInsets get insetsVertical => EdgeInsets.symmetric(vertical: value);

  EdgeInsets get insetsTop => EdgeInsets.only(top: value);

  EdgeInsets get insetsBottom => EdgeInsets.only(bottom: value);

  EdgeInsets get insetsLeft => EdgeInsets.only(left: value);

  EdgeInsets get insetsRight => EdgeInsets.only(right: value);
}
''';
