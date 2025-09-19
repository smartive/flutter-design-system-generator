import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final class AppBreakpoints {
  AppBreakpoints._();

  /// sm (640.0px) - media query width >= 640.0px
  static const sm = 640.0;

  /// md (768.0px) - media query width >= 768.0px
  static const md = 768.0;

  /// lg (1024.0px) - media query width >= 1024.0px
  static const lg = 1024.0;

  /// xl (1280.0px) - media query width >= 1280.0px
  static const xl = 1280.0;
}

enum AppBreakpoint {
  /// sm (640.0px)
  sm(AppBreakpoints.sm),

  /// md (768.0px)
  md(AppBreakpoints.md),

  /// lg (1024.0px)
  lg(AppBreakpoints.lg),

  /// xl (1280.0px)
  xl(AppBreakpoints.xl);

  const AppBreakpoint(this.width);

  final double width;

  int get integerWidth => width.toInt();
}

T responsiveValue<T>(
  T defaultValue, {
  BuildContext? context,
  T? sm,
  T? md,
  T? lg,
  T? xl,
}) {
  final width = context != null
      ? View.of(context).physicalSize.width
      : WidgetsBinding
            .instance
            .platformDispatcher
            .views
            .first
            .physicalSize
            .width;
  final values = {
    AppBreakpoints.xl: xl,
    AppBreakpoints.lg: lg,
    AppBreakpoints.md: md,
    AppBreakpoints.sm: sm,
  };
  return values.entries
          .skipWhile((e) => e.key > width)
          .map((e) => e.value)
          .firstWhere((e) => e != null, orElse: () => defaultValue)
      as T;
}

void main() {
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
        addTearDown(widgetTester.view.reset);

        widgetTester.view.devicePixelRatio = 1;
        widgetTester.view.physicalSize = Size(testCase.key, 800);

        await widgetTester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SafeArea(
                child: Center(
                  child: Text(
                    responsiveValue(
                      'xs',
                      sm: 'sm',
                      md: 'md',
                      lg: 'lg',
                      xl: 'xl',
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

        expect(find.text(testCase.value), findsOneWidget);
      },
    );

    testWidgets(
      'should return the correct value (${testCase.value}) for the screen size (${testCase.key}) with context',
      (widgetTester) async {
        addTearDown(widgetTester.view.reset);

        widgetTester.view.devicePixelRatio = 1;
        widgetTester.view.physicalSize = Size(testCase.key, 800);

        await widgetTester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SafeArea(
                child: Center(
                  child: Builder(
                    builder: (context) => Text(
                      responsiveValue(
                        'xs',
                        context: context,
                        sm: 'sm',
                        md: 'md',
                        lg: 'lg',
                        xl: 'xl',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

        expect(find.text(testCase.value), findsOneWidget);
      },
    );
  }
}
