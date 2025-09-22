# [6.0.0](https://github.com/smartive/flutter-design-system-generator/compare/v5.1.0...v6.0.0) (2025-09-22)


* chore(deps)!: update dependencies ([#24](https://github.com/smartive/flutter-design-system-generator/issues/24)) ([c5a58aa](https://github.com/smartive/flutter-design-system-generator/commit/c5a58aa4771382114983aed8278e2b3cb152442a))


### BREAKING CHANGES

* * Updates minimum supported SDK version to Dart 3.8.
* Use build 4.0.0

# [5.1.0](https://github.com/smartive/flutter-design-system-generator/compare/v5.0.0...v5.1.0) (2025-02-25)


### Features

* add border builder ([#17](https://github.com/smartive/flutter-design-system-generator/issues/17)) ([2d8004f](https://github.com/smartive/flutter-design-system-generator/commit/2d8004f2de33b90bf54e333925c69ad47e3bba0d))

# [5.0.0](https://github.com/smartive/flutter-design-system-generator/compare/v4.1.0...v5.0.0) (2025-02-10)


* ci: use service account for publishing to pubDev ([#13](https://github.com/smartive/flutter-design-system-generator/issues/13)) ([7a76173](https://github.com/smartive/flutter-design-system-generator/commit/7a76173cb20a3f465205e24ac1932f61f1855d61))
* chore!: bump to v5.0.0 ([#12](https://github.com/smartive/flutter-design-system-generator/issues/12)) ([dc25b9e](https://github.com/smartive/flutter-design-system-generator/commit/dc25b9e43c426470604b052a1800633bd87ac8c5))
* ci: update cycjimmy/semantic-release-action from v3 to v4 ([#11](https://github.com/smartive/flutter-design-system-generator/issues/11)) ([7aef10d](https://github.com/smartive/flutter-design-system-generator/commit/7aef10dc586f8b16dba73cf53b6459e83a7f8bca))
* chore(deps)!: update dart_style from v2 to v3 ([#10](https://github.com/smartive/flutter-design-system-generator/issues/10)) ([9c9d3e2](https://github.com/smartive/flutter-design-system-generator/commit/9c9d3e20cbae9ee8e76a3f7f0e631db13b674970))


### BREAKING CHANGES

* Use caret syntax for dependencies
* Use latestLanguageVersion in DartFormatter. This is required for compatibility with dart_style v3.


# [4.1.0](https://github.com/smartive/flutter-design-system-generator/compare/v4.0.0...v4.1.0) (2023-12-12)


### Features

* add icon size and border width generators ([#9](https://github.com/smartive/flutter-design-system-generator/issues/9)) ([c64df60](https://github.com/smartive/flutter-design-system-generator/commit/c64df609bdf3fd0caeda27c99f70c986485e9b2d))

# [4.0.0](https://github.com/smartive/flutter-design-system-generator/compare/v3.2.0...v4.0.0) (2023-08-29)


### Features

* use build_runner again ([#6](https://github.com/smartive/flutter-design-system-generator/issues/6)) ([a7fdd4a](https://github.com/smartive/flutter-design-system-generator/commit/a7fdd4ae173e142031499019abb30993721dd38d))


### BREAKING CHANGES

* This removes the binary executable
from the package and re-introduces the build_runner system.
It allows multiple design systems to be configured
and is more aligned to the "standard" dart build
behaviour. To migrate: Move the `design-system.json`
file into the `lib/` folder and give it another name,
such as `app.design-system.json`. Then remove your
ref to the binary `dart run design_system_generator generate`
and just run `dart run build_runner build` instead.

# [3.2.0](https://github.com/smartive/flutter-design-system-generator/compare/v3.1.1...v3.2.0) (2023-06-30)


### Features

* add typography text style generator ([#5](https://github.com/smartive/flutter-design-system-generator/issues/5)) ([700a1c9](https://github.com/smartive/flutter-design-system-generator/commit/700a1c9ac0b23bb7e5f0b40d74bc54290b67e1c0))

## [3.1.1](https://github.com/smartive/flutter-design-system-generator/compare/v3.1.0...v3.1.1) (2023-06-27)


### Bug Fixes

* **colors:** correctly attach prefixes and create camelCase names. ([2f854e8](https://github.com/smartive/flutter-design-system-generator/commit/2f854e80241305f933966f95085925c557d12880))

# [3.1.0](https://github.com/smartive/flutter-design-system-generator/compare/v3.0.0...v3.1.0) (2023-06-22)


### Features

* allow "false" as constant to disable specific branch of generation ([#4](https://github.com/smartive/flutter-design-system-generator/issues/4)) ([273205d](https://github.com/smartive/flutter-design-system-generator/commit/273205d18619bb26271fd730d51def1f02946592))

# [3.0.0](https://github.com/smartive/flutter-design-system-generator/compare/v2.0.0...v3.0.0) (2023-06-12)


### Features

* upgrade to new flutter app and improve code generation. ([#3](https://github.com/smartive/flutter-design-system-generator/issues/3)) ([44d4e1e](https://github.com/smartive/flutter-design-system-generator/commit/44d4e1e5ad35206e019c05be6da418c4e6ea790e))


### BREAKING CHANGES

* Flutter 2.x is not supported
anymore. This upgrades the generator to SDK
>= 3.x && < 4.x. Projects that use the generator
need to update their Flutter project to use SDK
>= 3.x.

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
