import 'package:build/build.dart';

import 'src/builder/color_builder.dart';
import 'src/builder/icon_size_builder.dart';
import 'src/builder/radius_builder.dart';
import 'src/builder/screen_builder.dart';
import 'src/builder/spatial_builder.dart';
import 'src/builder/typography_builder.dart';

Builder colorBuilder(BuilderOptions options) => ColorBuilder();
Builder spatialBuilder(BuilderOptions options) => SpatialBuilder();
Builder radiusBuilder(BuilderOptions options) => RadiusBuilder();
Builder typographyBuilder(BuilderOptions options) => TypographyBuilder();
Builder screenBuilder(BuilderOptions options) => ScreenBuilder();
Builder iconSizeBuilder(BuilderOptions options) => IconSizeBuilder();
