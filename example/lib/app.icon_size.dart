// GENERATED CODE - DO NOT MODIFY BY HAND
//
// **************************************************************************
// Design System Generator - icon_size
// *************************************************************************

abstract final class AppIconSizes {
  /// small (16.0px)
  static const small = 16.0;

  /// medium (24.0px)
  static const medium = 24.0;

  /// large (32.0px)
  static const large = 32.0;
}

enum AppIconSize {
  /// small (16.0px)
  small(AppIconSizes.small),

  /// medium (24.0px)
  medium(AppIconSizes.medium),

  /// large (32.0px)
  large(AppIconSizes.large);

  const AppIconSize(this.value);

  final double value;

  int get integer => value.toInt();
}
