/// Keys for text style properties.
const _textStyleKeys = [
  'family',
  'weight',
  'size',
  'lineHeight',
  'letterSpacing',
  'wordSpacing',
];

/// Represents a text style in the design system.
class DesignSystemTextStyle {
  /// The name of the text style.
  final String name;

  /// The font family of the text style.
  final String? family;

  /// The font size of the text style.
  final double? size;

  /// The font weight of the text style.
  final int? weight;

  /// The line height of the text style.
  final double? lineHeight;

  /// The letter spacing of the text style.
  final double? letterSpacing;

  /// The word spacing of the text style.
  final double? wordSpacing;

  /// Creates a [DesignSystemTextStyle] instance.
  const DesignSystemTextStyle(
    this.name,
    this.family,
    this.size,
    this.weight,
    this.lineHeight,
    this.letterSpacing,
    this.wordSpacing,
  );

  /// The default value for text styles.
  static const defaultValue = <DesignSystemTextStyle>[];

  /// Parses a map of text styles into a list of [DesignSystemTextStyle] instances.
  static Iterable<DesignSystemTextStyle> parse(
    Map<String, dynamic> textStyles, [
    String prefix = '',
  ]) sync* {
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
          e.value['wordSpacing']?.toDouble(),
        );
      } else {
        yield* parse(e.value as Map<String, dynamic>, '$prefix$name');
      }
    }
  }

  @override
  String toString() => 'Text Style $name';

  /// Checks if the text style name is valid.
  bool get isValid => name.startsWith(RegExp(r'[A-Za-z]'));

  /// Returns a valid name for the text style.
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
