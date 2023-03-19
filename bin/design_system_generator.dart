import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:design_system_generator/src/commands/generate.dart';

const usageErrorExitCode = 64;

void main(List<String> args) {
  final runner = CommandRunner(
      'design_system_generator', 'CLI for the design system generator.')
    ..addCommand(Generate());

  runner.run(args).catchError((error) {
    if (error is! UsageException) {
      throw error;
    }
    print(error);
    exit(usageErrorExitCode);
  });
}
