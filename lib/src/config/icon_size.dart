class DesignSystemIconSize {
  final String name;
  final double size;

  const DesignSystemIconSize(this.name, this.size);

  static const List<DesignSystemIconSize> defaultValue = [];

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

  bool get isValid => name.startsWith(RegExp(r'^[a-zA-Z][a-zA-Z0-9]*$'));

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
