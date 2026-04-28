/// Represents a box shadow in the design system.
class DesignSystemShadow {
  /// The name of the shadow.
  final String name;

  /// The blur radius of the shadow.
  final double blurRadius;

  /// The spread radius of the shadow.
  final double spreadRadius;

  /// The horizontal shadow offset.
  final double offsetDx;

  /// The vertical shadow offset.
  final double offsetDy;

  /// Creates a [DesignSystemShadow] instance.
  const DesignSystemShadow(
    this.name,
    this.blurRadius,
    this.spreadRadius,
    this.offsetDx,
    this.offsetDy,
  );

  /// The default list of shadows.
  static const List<DesignSystemShadow> defaultValue = [];

  /// Parses a map of shadows into an iterable of [DesignSystemShadow].
  static Iterable<DesignSystemShadow> parse(
    Map<String, dynamic> shadows,
  ) sync* {
    for (final e in shadows.entries) {
      if (e.value is! Map<String, dynamic>) {
        yield DesignSystemShadow(e.key, 0, 0, 0, 0);
        continue;
      }

      final shadow = e.value as Map<String, dynamic>;
      final offset = shadow['offset'];

      yield DesignSystemShadow(
        e.key,
        _toDouble(shadow['blurRadius']),
        _toDouble(shadow['spreadRadius']),
        offset is Map<String, dynamic> ? _toDouble(offset['dx']) : 0,
        offset is Map<String, dynamic> ? _toDouble(offset['dy']) : 0,
      );
    }
  }

  static double _toDouble(dynamic value) {
    if (value is double) {
      return value;
    }

    if (value is int) {
      return value.toDouble();
    }

    return 0;
  }

  @override
  String toString() =>
      'Shadow $name: blur=${blurRadius}px spread=${spreadRadius}px offset=($offsetDx, $offsetDy)';

  /// Checks if the shadow name is valid.
  bool get isValid => name.startsWith(RegExp(r'^[a-zA-Z][a-zA-Z0-9]*$'));

  /// Returns a valid name for the shadow.
  String get validName => isValid ? name : 'shadow$name';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DesignSystemShadow &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          blurRadius == other.blurRadius &&
          spreadRadius == other.spreadRadius &&
          offsetDx == other.offsetDx &&
          offsetDy == other.offsetDy;

  @override
  int get hashCode =>
      name.hashCode ^
      blurRadius.hashCode ^
      spreadRadius.hashCode ^
      offsetDx.hashCode ^
      offsetDy.hashCode;
}
