/// Represents an icon size in the design system.
class DesignSystemIconSize {
  /// The name of the icon size.
  final String name;

  /// The size value.
  final double size;

  /// Creates a [DesignSystemIconSize] instance.
  const DesignSystemIconSize(this.name, this.size);

  /// The default values for icon sizes.
  static const List<DesignSystemIconSize> defaultValue = [];

  /// Parses a map of icon sizes into a list of [DesignSystemIconSize] instances.
  static Iterable<DesignSystemIconSize> parse(
      Map<String, dynamic> iconSizes) sync* {
    for (final e in iconSizes.entries) {
      if (e.value is double) {
        yield DesignSystemIconSize(e.key, e.value);
      } else if (e.value is int) {
        yield DesignSystemIconSize(e.key, e.value.toDouble());
      } else {
        yield DesignSystemIconSize(e.key, 0);
      }
    }
  }

  @override
  String toString() => 'IconSize $name: ${size}px';

  /// Checks if the icon size name is valid.
  bool get isValid => name.startsWith(RegExp(r'^[a-zA-Z][a-zA-Z0-9]*$'));

  /// Returns a valid name for the icon size.
  String get validName => isValid ? name : 'size$name';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DesignSystemIconSize &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          size == other.size;

  @override
  int get hashCode => name.hashCode ^ size.hashCode;
}
