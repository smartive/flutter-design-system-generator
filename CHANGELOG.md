# [2.0.0](https://github.com/smartive/flutter-design-system-generator/compare/v1.0.0...v2.0.0) (2023-03-23)


### Features

* create CLI for generation. ([#2](https://github.com/smartive/flutter-design-system-generator/issues/2)) ([b08c266](https://github.com/smartive/flutter-design-system-generator/commit/b08c266b748edf9a8a7b9abebae694e4eb9f9fec))


### BREAKING CHANGES

* since the dart build
system is not as dynamic as it should be for
this usecase, using a builder is not
sufficient. Now a CLI executable
is used to find and parse the design system
configuration and then generate the
specific design token files according to
the configuration.

# 1.0.0 (2023-03-17)


### Bug Fixes

* json schema must require at least one prop per topic ([2a80893](https://github.com/smartive/flutter-design-system-generator/commit/2a80893e52237c27efd6fa68e4f7a90f88e3a53d))


### Features

* add border radii builder for rounded corners ([ed4a727](https://github.com/smartive/flutter-design-system-generator/commit/ed4a7274ab35d0c1d02d2dfe9046ded3a08f4170))
* add color builder to generate app color class and enum ([a890298](https://github.com/smartive/flutter-design-system-generator/commit/a8902989491641534753aeaf914d1affadfb1721))
* add screenbuilder that creates app breakpoints and a responsive value helper ([5410155](https://github.com/smartive/flutter-design-system-generator/commit/54101554ffae0e97125936a87bc3fcd1f1ffd5f6))
* add spatial builder to create a general way for spacings in the app ([686483b](https://github.com/smartive/flutter-design-system-generator/commit/686483b3aea89bec049a9b29e7713d4e51011cc2))
* **color generator:** add default values if none provided ([8c6ccae](https://github.com/smartive/flutter-design-system-generator/commit/8c6ccaeafc7287904b7a33f1f250c413cdffc7d7))
