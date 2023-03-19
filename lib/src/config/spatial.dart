class DesignSystemSpatial {
  final String name;
  final double space;

  const DesignSystemSpatial(this.name, this.space);

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

  static Iterable<DesignSystemSpatial> parse(
      Map<String, dynamic> spatials) sync* {
    for (final e in spatials.entries) {
      if (e.value is double) {
        yield DesignSystemSpatial(e.key, e.value);
      } else if (e.value is int) {
        yield DesignSystemSpatial(e.key, e.value.toDouble());
      }
    }
  }

  @override
  String toString() => 'Spatial $name: ${space}px';

  bool get isValid => name.startsWith(RegExp(r'[A-Za-z]'));

  String get validName => isValid ? name : 'spatial$name';
}
