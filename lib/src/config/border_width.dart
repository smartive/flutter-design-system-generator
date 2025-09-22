/// Represents a border width in the design system.
class DesignSystemBorderWidth {
  /// The name of the border width.
  final String name;

  /// The width value.
  final double width;

  /// Creates a [DesignSystemBorderWidth] instance.
  const DesignSystemBorderWidth(this.name, this.width);

  /// The default list of border widths.
  static const List<DesignSystemBorderWidth> defaultValue = [];

  /// Parses a map of border widths into an iterable of [DesignSystemBorderWidth].
  static Iterable<DesignSystemBorderWidth> parse(
    Map<String, dynamic> borderWidths,
  ) sync* {
    for (final e in borderWidths.entries) {
      if (e.value is double) {
        yield DesignSystemBorderWidth(e.key, e.value);
      } else if (e.value is int) {
        yield DesignSystemBorderWidth(e.key, e.value.toDouble());
      } else {
        yield DesignSystemBorderWidth(e.key, 0);
      }
    }
  }

  @override
  String toString() => 'BorderWidth $name: ${width}px';

  /// Checks if the border width name is valid.
  bool get isValid => name.startsWith(RegExp(r'^[a-zA-Z][a-zA-Z0-9]*$'));

  /// Returns a valid name for the border width.
  String get validName => isValid ? name : 'width$name';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DesignSystemBorderWidth &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          width == other.width;

  @override
  int get hashCode => name.hashCode ^ width.hashCode;
}
