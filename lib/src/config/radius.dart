/// Represents a border radius in the design system.
class DesignSystemBorderRadius {
  /// The name of the border radius.
  final String name;

  /// The radius value.
  final double radius;

  /// Creates a [DesignSystemBorderRadius] instance.
  const DesignSystemBorderRadius(this.name, this.radius);

  /// The default values for border radii.
  static const defaultValue = [
    DesignSystemBorderRadius('none', 0),
    DesignSystemBorderRadius('small', 2),
    DesignSystemBorderRadius('rounded', 4),
    DesignSystemBorderRadius('medium', 6),
    DesignSystemBorderRadius('large', 8),
    DesignSystemBorderRadius('full', 9999),
  ];

  /// Parses a map of border radii into a list of [DesignSystemBorderRadius] instances.
  static Iterable<DesignSystemBorderRadius> parse(
      Map<String, dynamic> radii) sync* {
    for (final e in radii.entries) {
      if (e.value is double) {
        yield DesignSystemBorderRadius(e.key, e.value);
      } else if (e.value is int) {
        yield DesignSystemBorderRadius(e.key, e.value.toDouble());
      } else {
        yield DesignSystemBorderRadius(e.key, 0);
      }
    }
  }

  @override
  String toString() => 'Border Radius $name: ${radius}px';

  /// Checks if the border radius name is valid.
  bool get isValid => name.startsWith(RegExp(r'[A-Za-z]'));

  /// Returns a valid name for the border radius.
  String get validName => isValid ? name : 'radius$name';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DesignSystemBorderRadius &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          radius == other.radius;

  @override
  int get hashCode => name.hashCode ^ radius.hashCode;
}
