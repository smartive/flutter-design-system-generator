import 'package:build/build.dart';
import 'package:design_system_generator/src/builder/color_builder.dart';
import 'package:design_system_generator/src/builder/radius_builder.dart';
import 'package:design_system_generator/src/builder/screen_builder.dart';
import 'package:design_system_generator/src/builder/spatial_builder.dart';
import 'package:design_system_generator/src/builder/typography_builder.dart';

Builder colorBuilder(BuilderOptions options) => ColorBuilder();
Builder spatialBuilder(BuilderOptions options) => SpatialBuilder();
Builder radiusBuilder(BuilderOptions options) => RadiusBuilder();
Builder typographyBuilder(BuilderOptions options) => TypographyBuilder();
Builder screenBuilder(BuilderOptions options) => ScreenBuilder();
