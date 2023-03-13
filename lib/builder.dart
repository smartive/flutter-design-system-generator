library builder;

import 'package:build/build.dart';

import 'src/color_builder.dart';
import 'src/spatial_builder.dart';

Builder colorBuilder(BuilderOptions options) => ColorBuilder();
Builder spatialBuilder(BuilderOptions options) => SpatialBuilder();
// TODO: border radius builder
// TODO: screens / breakpoint radius builder