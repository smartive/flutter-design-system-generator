import 'package:build_test/build_test.dart';
import 'package:design_system_generator/src/spatial_builder.dart';
import 'package:flutter_test/flutter_test.dart';

part 'spatial_builder_test.data.dart';

void main() {
  group('SpatialBuilder -', () {
    test('should not throw an exception',
        () => testBuilder(SpatialBuilder(), _inputEmptyDesignSystem));

    test(
        'should generate default spatials if none provided',
        () => testBuilder(SpatialBuilder(), _inputEmptyDesignSystem,
            outputs: _outputDefaultSpatials));

    test(
        'should generate custom spatials if provided',
        () => testBuilder(SpatialBuilder(), _inputValidSpatials,
            outputs: _outputValidSpatials));

    test(
        'should create valid names for invalid spatial names',
        () => testBuilder(SpatialBuilder(), _inputInvalidSpatialNames,
            outputs: _outputInvalidSpatialNames));
  });
}
