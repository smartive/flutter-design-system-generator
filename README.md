# Design System Generator

This generator allows you to generate a design system for your project.
You can use it to generate design tokens based on a JSON configuration.

The configuration can be viewed at [Design System JSON Schema](./design-system.schema.json).

The generator creates the following elements:

- Colors
- Border Widths
- Border Radii
- Spatials (spacing)
- Screensizes (Breakpoints) and a responsive helper function
- Text Styles (Typography)
- Icon Sizes

## Usage

Refer to the [example](./example/example.md) to see how to use the generator.

Summary:

- Create a `<name>.design-system.json` file somewhere in your lib folder.
  The generators will run for each file with the `.design-system.json` extension.
  So you can have multiple design systems in your project.
- Configure your design system to your wishes
  (add `"$schema": "https://github.com/smartive/flutter-design-system-generator/blob/main/design-system.schema.json"`)
  to the start to get JSON schema validation
- Install the build runner with `flutter pub add dev:build_runner`
- Install the design system generator with `flutter pub add dev:design_system_generator`
- Run `dart run build_runner build --delete-conflicting-outputs` to generate the design system
