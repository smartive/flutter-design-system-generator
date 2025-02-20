/// Represents a spatial value in the design system.
class DesignSystemSpatial {
  /// The name of the spatial value.
  final String name;

  /// The space value.
  final double space;

  /// Creates a [DesignSystemSpatial] instance.
  const DesignSystemSpatial(this.name, this.space);

  /// The default values for spatial values.
  static const defaultValue = [
    DesignSystemSpatial('spatial0', 0),
    DesignSystemSpatial('spatial1', 1),
    DesignSystemSpatial('spatial2', 2),
    DesignSystemSpatial('spatial4', 4),
    DesignSystemSpatial('spatial8', 8),
    DesignSystemSpatial('spatial10', 10),
    DesignSystemSpatial('spatial12', 12),
    DesignSystemSpatial('spatial14', 14),
    DesignSystemSpatial('spatial16', 16),
    DesignSystemSpatial('spatial20', 20),
    DesignSystemSpatial('spatial24', 24),
    DesignSystemSpatial('spatial28', 28),
    DesignSystemSpatial('spatial32', 32),
    DesignSystemSpatial('spatial36', 36),
    DesignSystemSpatial('spatial40', 40),
    DesignSystemSpatial('spatial48', 48),
    DesignSystemSpatial('spatial56', 56),
    DesignSystemSpatial('spatial64', 64),
    DesignSystemSpatial('spatial72', 72),
    DesignSystemSpatial('spatial80', 80),
    DesignSystemSpatial('spatial96', 96),
    DesignSystemSpatial('spatial112', 112),
    DesignSystemSpatial('spatial128', 128),
    DesignSystemSpatial('spatial144', 144),
    DesignSystemSpatial('spatial160', 160),
    DesignSystemSpatial('spatial176', 176),
    DesignSystemSpatial('spatial192', 192),
    DesignSystemSpatial('spatial208', 208),
    DesignSystemSpatial('spatial224', 224),
    DesignSystemSpatial('spatial240', 240),
    DesignSystemSpatial('spatial256', 256),
    DesignSystemSpatial('spatial288', 288),
    DesignSystemSpatial('spatial320', 320),
    DesignSystemSpatial('spatial384', 384),
    DesignSystemSpatial('spatial448', 448),
    DesignSystemSpatial('spatial512', 512),
  ];

  /// Parses a map of spatial values into a list of [DesignSystemSpatial] instances.
  static Iterable<DesignSystemSpatial> parse(
      Map<String, dynamic> spatials) sync* {
    for (final e in spatials.entries) {
      if (e.value is double) {
        yield DesignSystemSpatial(e.key, e.value);
      } else if (e.value is int) {
        yield DesignSystemSpatial(e.key, e.value.toDouble());
      } else {
        yield DesignSystemSpatial(e.key, 0);
      }
    }
  }

  @override
  String toString() => 'Spatial $name: ${space}px';

  /// Checks if the spatial name is valid.
  bool get isValid => name.startsWith(RegExp(r'[A-Za-z]'));

  /// Returns a valid name for the spatial value.
  String get validName => isValid ? name : 'spatial$name';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DesignSystemSpatial &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          space == other.space;

  @override
  int get hashCode => name.hashCode ^ space.hashCode;
}
