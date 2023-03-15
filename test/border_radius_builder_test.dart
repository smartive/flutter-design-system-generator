import 'package:build_test/build_test.dart';
import 'package:design_system_generator/src/border_radius_builder.dart';
import 'package:flutter_test/flutter_test.dart';

part 'border_radius_builder_test.data.dart';

void main() {
  group('BorderRadiusBuilder -', () {
    test('should not throw an exception',
        () => testBuilder(BorderRadiusBuilder(), _inputEmptyDesignSystem));

    test(
        'should generate default radii if none provided',
        () => testBuilder(BorderRadiusBuilder(), _inputEmptyDesignSystem,
            outputs: _outputDefaultRadii));

    test(
        'should generate custom radii if provided',
        () => testBuilder(BorderRadiusBuilder(), _inputValidRadii,
            outputs: _outputValidRadii));

    test(
        'should create valid names for invalid radius names',
        () => testBuilder(BorderRadiusBuilder(), _inputInvalidRadiiNames,
            outputs: _outputInvalidRadiiNames));
  });
}
