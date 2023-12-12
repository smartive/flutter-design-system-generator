class DesignSystemBorderWidth {
  final String name;
  final double width;

  const DesignSystemBorderWidth(this.name, this.width);

  static const List<DesignSystemBorderWidth> defaultValue = [];

  static Iterable<DesignSystemBorderWidth> parse(
      Map<String, dynamic> borderWidths) sync* {
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

  bool get isValid => name.startsWith(RegExp(r'^[a-zA-Z][a-zA-Z0-9]*$'));

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
