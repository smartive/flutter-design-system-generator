# Using the design system generator

To use the design system generator, you need to install it as a dev dependency.

`flutter pub add dev:design_system_generator`.

Then, you need to create a `design-system.json` file in your root folder.
There is a json schema to enable autocompletion and schema validation for
your configuration file.

After you have created your configuration file, you can run the generator
with `dart run design_system_generator generate`.

Note that colors are in the format `#RRGGBB` or `#RRGGBBAA` (with alpha).

## Example Configuration

```json
{
  "$schema": "https://github.com/smartive/flutter-design-system-generator/blob/main/design-system.schema.json",
  "colors": {
    "orange": {
      "DEFAULT": "#FFA500",
      "light": "#FFDAB9",
      "dark": "#FF8C00"
    },
    "white": "#FFFFFF",
    "black": "#000000",
    "halfTransparentBlue": "#0000FF80"
  },
  "screens": {
    "medium": 700,
    "big": 1200
  },
  "spacings": {
    "small": 10,
    "medium": 20,
    "big": -30
  },
  "borderRadius": {
    "normal": 8,
    "full": 9999
  },
  "typography": {
    "root": {
      "family": "Arial",
      "size": 16,
      "weight": 400,
      "lineHeight": 16,
      "letterSpacing": 1.2,
      "wordSpacing": 2.2
    },
    "display": {
      "1": {
        "family": "Arial"
      }
    }
  }
}
```
