import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:path/path.dart' as path;

import '../config/config.dart';
import '../generators/colors.dart';
import '../generators/radii.dart';
import '../generators/screens.dart';
import '../generators/spatials.dart';

class Generate extends Command {
  @override
  String get name => 'generate';

  @override
  String get description =>
      'Generate the dart files for the given design system configuration.';

  Generate() {
    argParser.addOption('config',
        abbr: 'c',
        help:
            'Location (filepath) of the configuration json file for the design system.',
        valueHelp: 'path to config json');
  }

  @override
  Future run() async {
    var configLocation = argResults?['config'];
    if (configLocation == null) {
      try {
        final glob = await Glob('**design-system.json').list().first;
        configLocation = glob.path;
      } catch (_) {
        print(
            'No config named "design-system.json" found in the current directory (and its decendants).');
        exit(1);
      }
    }

    // Steps to generate design system:
    // - parse config
    // - create / truncate files at location
    // - generate all files

    final configFile = File(path.join(path.current, configLocation));
    if (!await configFile.exists()) {
      print('Config does not exist: $configFile.');
      exit(1);
    }

    print('Generate design system tokens based on config "$configFile".');

    final config = DesignSystemConfig.fromJson(
        jsonDecode(await configFile.readAsString()));

    Future generateFile<T>(String Function(Iterable<T>) generator,
        Iterable<T> data, File destination) async {
      if (data.isEmpty) {
        print('No data for $destination, skipping.');
        return;
      }

      print('Write generated code to $destination.');

      if (!await destination.exists()) {
        await destination.create(recursive: true);
      }

      final writer = destination.openWrite();

      try {
        writer.write(generator(data));
        await writer.flush();
      } finally {
        await writer.close();
      }
    }

    await Future.wait([
      generateFile(colorGenerator, config.colors, config.colorsFile),
      generateFile(radiiGenerator, config.radii, config.radiiFile),
      generateFile(screenGenerator, config.screens, config.screensFile),
      generateFile(spatialGenerator, config.spatials, config.spatialsFile),
    ]);
  }
}
