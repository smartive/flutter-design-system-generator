import '../config/color.dart';

String colorGenerator(Iterable<DesignSystemColor> colors) =>
    '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Colors
// **************************************************************************

import 'dart:ui';

${_class(colors)}
${_enum(colors)}''';

String _class(Iterable<DesignSystemColor> colors) => '''
class AppColors {
  AppColors._();

${colors.map((e) => [
          if (!e.isValid)
            '  // ${e.validName} contains a non-valid 6 or 8 char hex string ("${e.hex}").',
          '  static const ${e.validName} = Color(0x${e.colorHex});'
        ].join('\n')).join('\n')}
}
''';

String _enum(Iterable<DesignSystemColor> colors) => '''
enum AppColor {
${colors.map((e) => '  ${e.validName}(AppColors.${e.validName})').join(',\n')};

  const AppColor(this.color);

  final Color color;

  Color withOpacity(double opacity) => color.withOpacity(opacity);

  static AppColor fromColor(Color color, [AppColor? orElse]) =>
      AppColor.values.firstWhere((e) => e.color == color,
          orElse: orElse == null ? null : () => orElse);
}
''';
