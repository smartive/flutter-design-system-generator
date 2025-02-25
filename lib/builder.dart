import 'package:build/build.dart';

import 'src/builder/border_builder.dart';
import 'src/builder/border_width_builder.dart';
import 'src/builder/color_builder.dart';
import 'src/builder/icon_size_builder.dart';
import 'src/builder/radius_builder.dart';
import 'src/builder/screen_builder.dart';
import 'src/builder/spatial_builder.dart';
import 'src/builder/typography_builder.dart';

/// Creates a [ColorBuilder] instance.
///
/// This builder generates color-related design tokens from the input configuration.
Builder colorBuilder(BuilderOptions options) => ColorBuilder();

/// Creates a [SpatialBuilder] instance.
///
/// This builder generates spacing and layout-related design tokens.
Builder spatialBuilder(BuilderOptions options) => SpatialBuilder();

/// Creates a [BorderWidthBuilder] instance.
///
/// This builder generates border width-related design tokens.
Builder borderWidthBuilder(BuilderOptions options) => BorderWidthBuilder();

/// Creates a [BorderBuilder] instance.
///
/// This builder generates border-related util functions.
Builder borderBuilder(BuilderOptions options) => BorderBuilder();

/// Creates a [RadiusBuilder] instance.
///
/// This builder generates border radius-related design tokens.
Builder radiusBuilder(BuilderOptions options) => RadiusBuilder();

/// Creates a [TypographyBuilder] instance.
///
/// This builder generates typography-related design tokens.
Builder typographyBuilder(BuilderOptions options) => TypographyBuilder();

/// Creates a [ScreenBuilder] instance.
///
/// This builder generates screen size-related design tokens.
Builder screenBuilder(BuilderOptions options) => ScreenBuilder();

/// Creates an [IconSizeBuilder] instance.
///
/// This builder generates icon size-related design tokens.
Builder iconSizeBuilder(BuilderOptions options) => IconSizeBuilder();
