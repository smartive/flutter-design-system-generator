import 'package:build_test/build_test.dart';
import 'package:design_system_generator/src/screen_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

part 'screen_builder_test.data.dart';

void main() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();

  group('ScreenBuilder -', () {
    group('Generator -', () {
      test('should not throw an exception',
          () => testBuilder(ScreenBuilder(), _inputEmptyDesignSystem));

      test(
          'should generate default screens if none provided',
          () => testBuilder(ScreenBuilder(), _inputEmptyDesignSystem,
              outputs: _outputDefaultScreens));

      test(
          'should generate custom screens if provided',
          () => testBuilder(ScreenBuilder(), _inputValidScreens,
              outputs: _outputValidScreens));

      test(
          'should create valid names for invalid screen names',
          () => testBuilder(ScreenBuilder(), _inputInvalidScreenNames,
              outputs: _outputInvalidScreenNames));
    });

    group('Generated Code - Responsive Helper -', () {
      final testCases = <double, String>{
        500: 'xs',
        650: 'sm',
        800: 'md',
        1100: 'lg',
        1300: 'xl',
      };

      for (final testCase in testCases.entries) {
        testWidgets(
            'should return the correct value (${testCase.value}) for the screen size (${testCase.key})',
            (widgetTester) async {
          binding.window.physicalSizeTestValue = Size(testCase.key, 800);
          binding.window.devicePixelRatioTestValue = 1;

          await widgetTester.pumpWidget(MaterialApp(
              home: Scaffold(
                  body: SafeArea(
                      child: Center(
                          child: Text(responsiveValue('xs',
                              sm: 'sm', md: 'md', lg: 'lg', xl: 'xl')))))));

          expect(find.text(testCase.value), findsOneWidget);
        });
      }
    });
  });
}
