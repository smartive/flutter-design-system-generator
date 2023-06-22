class DesignSystemColor {
  final String name;
  final String hex;

  const DesignSystemColor(this.name, this.hex);

  static const defaultValue = [
    DesignSystemColor('black', '#000000'),
    DesignSystemColor('white', '#FFFFFF'),
    DesignSystemColor('transparent', '#00000000'),
  ];

  static Iterable<DesignSystemColor> parse(Map<String, dynamic> colors,
      [String prefix = '']) sync* {
    for (final e in colors.entries) {
      final name = e.key.replaceAll('DEFAULT', '');
      if (e.value is String) {
        yield DesignSystemColor('$prefix$name', e.value);
      } else if (e.value is Map<String, dynamic>) {
        yield* parse(e.value as Map<String, dynamic>, name);
      }
    }
  }

  @override
  String toString() => 'Color $name: $hex';

  bool get isValid =>
      RegExp(r'^#([0-9a-fA-F]{3}|[0-9a-fA-F]{6}|[0-9a-fA-F]{8})$')
          .hasMatch(hex);

  String get colorHex {
    if (!isValid) {
      return '00000000';
    }

    if (hex.length == 4) {
      final a = hex.substring(1, 2);
      final b = hex.substring(2, 3);
      final c = hex.substring(3, 4);
      return 'FF$a$a$b$b$c$c';
    }

    if (hex.length == 7) {
      return 'FF${hex.substring(1)}';
    }

    return '${hex.substring(7, 9)}${hex.substring(1, 7)}';
  }

  bool get isNameValid => name.startsWith(RegExp(r'[A-Za-z]'));

  String get validName => isNameValid ? name : 'color$name';
}
