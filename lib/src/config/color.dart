/// Represents a color in the design system.
class DesignSystemColor {
  /// The name of the color.
  final String name;

  /// The hex value of the color.
  final String hex;

  /// Creates a [DesignSystemColor] instance.
  const DesignSystemColor(this.name, this.hex);

  /// The default values for colors.
  static const defaultValue = [
    DesignSystemColor('black', '#000000'),
    DesignSystemColor('white', '#FFFFFF'),
    DesignSystemColor('transparent', '#00000000'),
  ];

  /// Parses a map of colors into a list of [DesignSystemColor] instances.
  static Iterable<DesignSystemColor> parse(
    Map<String, dynamic> colors, [
    String prefix = '',
  ]) sync* {
    for (final e in colors.entries) {
      var name = e.key.replaceAll('DEFAULT', '');
      if (prefix != '' && name.length > 1) {
        name = name[0].toUpperCase() + name.substring(1);
      }

      if (e.value is String) {
        yield DesignSystemColor('$prefix$name', e.value);
      } else if (e.value is Map<String, dynamic>) {
        yield* parse(e.value as Map<String, dynamic>, '$prefix$name');
      }
    }
  }

  @override
  String toString() => 'Color $name: $hex';

  /// Checks if the hex value is valid.
  bool get isValid => RegExp(
    r'^#([0-9a-fA-F]{3}|[0-9a-fA-F]{6}|[0-9a-fA-F]{8})$',
  ).hasMatch(hex);

  /// Returns the color hex value in ARGB format.
  String get colorHex {
    if (!isValid) {
      return '00000000';
    }

    if (hex.length == 4) {
      final a = hex.substring(1, 2);
      final b = hex.substring(2, 3);
      final c = hex.substring(3, 4);
      return 'FF$a$a$b$b$c$c';
    }

    if (hex.length == 7) {
      return 'FF${hex.substring(1)}';
    }

    return '${hex.substring(7, 9)}${hex.substring(1, 7)}';
  }

  /// Checks if the name is valid.
  bool get isNameValid => name.startsWith(RegExp(r'[A-Za-z]'));

  /// Returns a valid name for the color.
  String get validName => isNameValid ? name : 'color$name';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DesignSystemColor &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          hex == other.hex;

  @override
  int get hashCode => name.hashCode ^ hex.hashCode;
}
