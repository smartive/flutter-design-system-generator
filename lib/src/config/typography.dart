const _textStyleKeys = [
  'family',
  'weight',
  'size',
  'lineHeight',
  'letterSpacing',
  'wordSpacing'
];

class DesignSystemTextStyle {
  final String name;
  final String? family;
  final double? size;
  final int? weight;
  final double? lineHeight;
  final double? letterSpacing;
  final double? wordSpacing;

  const DesignSystemTextStyle(this.name, this.family, this.size, this.weight,
      this.lineHeight, this.letterSpacing, this.wordSpacing);

  static const defaultValue = <DesignSystemTextStyle>[];

  static Iterable<DesignSystemTextStyle> parse(Map<String, dynamic> textStyles,
      [String prefix = '']) sync* {
    for (final e in textStyles.entries) {
      var name = e.key.replaceAll('DEFAULT', '');
      if (prefix != '' && name.length > 1) {
        name = name[0].toUpperCase() + name.substring(1);
      }

      if (e.value is Map<String, dynamic> &&
          _textStyleKeys.any(e.value.containsKey)) {
        yield DesignSystemTextStyle(
            '$prefix$name',
            e.value['family'],
            e.value['size']?.toDouble(),
            e.value['weight'],
            e.value['lineHeight']?.toDouble(),
            e.value['letterSpacing']?.toDouble(),
            e.value['wordSpacing']?.toDouble());
      } else {
        yield* parse(e.value as Map<String, dynamic>, '$prefix$name');
      }
    }
  }

  @override
  String toString() => 'Text Style $name';

  bool get isValid => name.startsWith(RegExp(r'[A-Za-z]'));

  String get validName => isValid ? name : 'typo$name';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DesignSystemTextStyle &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          family == other.family &&
          size == other.size &&
          weight == other.weight &&
          lineHeight == other.lineHeight &&
          letterSpacing == other.letterSpacing &&
          wordSpacing == other.wordSpacing;

  @override
  int get hashCode =>
      name.hashCode ^
      family.hashCode ^
      size.hashCode ^
      weight.hashCode ^
      lineHeight.hashCode ^
      letterSpacing.hashCode ^
      wordSpacing.hashCode;
}
