/// Represents a screen size in the design system.
class DesignSystemScreen {
  /// The name of the screen size.
  final String name;

  /// The width of the screen size.
  final double width;

  /// Creates a [DesignSystemScreen] instance.
  const DesignSystemScreen(this.name, this.width);

  /// The default values for screen sizes.
  static const defaultValue = [
    DesignSystemScreen('sm', 640),
    DesignSystemScreen('md', 768),
    DesignSystemScreen('lg', 1024),
    DesignSystemScreen('xl', 1280),
  ];

  /// Parses a map of screen sizes into a list of [DesignSystemScreen] instances.
  static Iterable<DesignSystemScreen> parse(
      Map<String, dynamic> spatials) sync* {
    for (final e in spatials.entries) {
      if (e.value is double) {
        yield DesignSystemScreen(e.key, e.value);
      } else if (e.value is int) {
        yield DesignSystemScreen(e.key, e.value.toDouble());
      } else {
        yield DesignSystemScreen(e.key, 0);
      }
    }
  }

  @override
  String toString() => 'Screen $name: ${width}px';

  /// Checks if the screen size name is valid.
  bool get isValid => name.startsWith(RegExp(r'[A-Za-z]'));

  /// Returns a valid name for the screen size.
  String get validName => isValid ? name : 'screen$name';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DesignSystemScreen &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          width == other.width;

  @override
  int get hashCode => name.hashCode ^ width.hashCode;
}
