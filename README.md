# Design System Generator

This generator (or builder, since it runs with the dart build runner)
allows you to generate a design system for your project.
You can use it to generate design tokens based on a JSON configuration.

The configuration can be viewed at [Design System JSON Schema](./design-system.schema.json).

The current version is pretty static (file-wise). The design system json **must**
be under `lib/design-system.json`, otherwise nothing gets generated. Furthermore,
the results are all created in `lib/ui/identity/*`.

The generator creates the following elements:

- Colors
- Border Radii
- Spatials (spacing)
- Screensizes (Breakpoints) and a responsive helper function

## Usage

Refer to the [example](./example/example.md) to see how to use the generator.

Summary:

- Create a `design-system.json` file in your `lib` folder
- Configure your design system to your wishes
  (add `"$schema": "https://github.com/smartive/flutter-design-system-generator/blob/main/design-system.schema.json"`) to the start to get
  JSON schema validation
- Run `flutter pub run build_runner build` to generate the design system
