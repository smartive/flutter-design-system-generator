# Design System Generator

This generator allows you to generate a design system for your project.
You can use it to generate design tokens based on a JSON configuration.

The configuration can be viewed at [Design System JSON Schema](./design-system.schema.json).

The generator creates the following elements:

- Colors
- Border Radii
- Spatials (spacing)
- Screensizes (Breakpoints) and a responsive helper function

## Usage

Refer to the [example](./example/example.md) to see how to use the generator.

Summary:

- Create a `design-system.json` file in your app folder.
  The file can be passed as config or will be searched in your
  folder by a glob pattern.
- Configure your design system to your wishes
  (add `"$schema": "https://github.com/smartive/flutter-design-system-generator/blob/main/design-system.schema.json"`)
  to the start to get JSON schema validation
- Run `flutter pub run design_system_generator generate` to generate the design system
