class DesignSystemScreen {
  final String name;
  final double width;

  const DesignSystemScreen(this.name, this.width);

  static const defaultValue = [
    DesignSystemScreen('sm', 640),
    DesignSystemScreen('md', 768),
    DesignSystemScreen('lg', 1024),
    DesignSystemScreen('xl', 1280),
  ];

  static Iterable<DesignSystemScreen> parse(
      Map<String, dynamic> spatials) sync* {
    for (final e in spatials.entries) {
      if (e.value is double) {
        yield DesignSystemScreen(e.key, e.value);
      } else if (e.value is int) {
        yield DesignSystemScreen(e.key, e.value.toDouble());
      }
    }
  }

  @override
  String toString() => 'Screen $name: ${width}px';

  bool get isValid => name.startsWith(RegExp(r'[A-Za-z]'));

  String get validName => isValid ? name : 'screen$name';
}
