import 'package:design_system_generator/src/config/typography.dart';

String typographyGenerator(Iterable<DesignSystemTextStyle> typo) => typo.isEmpty
    ? ''
    : '''// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Design System Generator - Text Styles & Typography
// **************************************************************************

import 'package:flutter/widgets.dart';

${_class(typo)}
${_enum(typo)}''';

String _class(Iterable<DesignSystemTextStyle> typo) => '''
final class AppTypographies {
  AppTypographies._();

${typo.map((e) => [
          '  /// Text Style Definition ${e.validName}.',
          '  static const ${e.validName} = TextStyle(',
          if (e.family != null) '    fontFamily: \'${e.family}\',',
          if (e.weight != null) '    fontWeight: FontWeight.w${e.weight},',
          if (e.size != null) '    fontSize: ${e.size},',
          if (e.lineHeight != null && e.size != null)
            '    height: (${e.lineHeight} / ${e.size}),',
          if (e.letterSpacing != null) '    letterSpacing: ${e.letterSpacing},',
          if (e.wordSpacing != null) '    wordSpacing: ${e.wordSpacing},',
          '  );',
        ].join('\n')).join('\n')}
}
''';

String _enum(Iterable<DesignSystemTextStyle> typo) => '''
enum AppTypography {
${typo.map((e) => '  ${e.validName}(AppTypographies.${e.validName})').join(',\n')};

  const AppTypography(this.textStyle);

  final TextStyle textStyle;
}
''';
