class DesignSystemBorderRadius {
  final String name;
  final double radius;

  const DesignSystemBorderRadius(this.name, this.radius);

  static const defaultValue = [
    DesignSystemBorderRadius('none', 0),
    DesignSystemBorderRadius('small', 2),
    DesignSystemBorderRadius('rounded', 4),
    DesignSystemBorderRadius('medium', 6),
    DesignSystemBorderRadius('large', 8),
    DesignSystemBorderRadius('full', 9999),
  ];

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

  bool get isValid => name.startsWith(RegExp(r'[A-Za-z]'));

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
