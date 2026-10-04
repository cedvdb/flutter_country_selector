# Flutter Country Selector

> **This package has been merged into [phone_form_field](https://pub.dev/packages/phone_form_field).**
>
> Since 3.0.0, `flutter_country_selector` is a thin re-export of
> `package:phone_form_field/country_selector.dart`. The sources, the
> translations and the tests live in `phone_form_field` now, so prefer
> importing it directly:
>
> ```dart
> // still works
> import 'package:flutter_country_selector/flutter_country_selector.dart';
>
> // preferred
> import 'package:phone_form_field/country_selector.dart';
> ```

Country selector of the phone_form_field package exported in its own package.

## Features

- localization: lots of supported languages
- semantics applied

## Demo

Demo available here: <https://cedvdb.github.io/flutter_country_selector/>

![](https://github.com/cedvdb/flutter_country_selector/blob/main/demo.gif?raw=true)

## Usage

Use `CountrySelector.page` if you need to show the selector inside a widget that is full screen. If you need to show the selector inside a modal of some sort, use `CountrySelector.sheet` instead.

```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (ctx) => CountrySelector.page(
      onCountrySelected: (country) => Navigator.of(context).pop(country),
    ),
  ),
)
```

## Localization

### Dynamic localization

Use `CountrySelectorLocalization.of(context)?.countryName(isoCode)` when you need to dynamically localize the name of a country.

### Supported languages

- ar
- de
- el
- en
- es
- fa
- fr
- he
- hi
- hu
- it
- ko
- ku
- nb
- nl
- pl
- pt
- ro
- ru
- sv
- tr
- uk
- ur
- uz
- vi
- zh  

### Setup

Example setup:

```dart
import 'package:material_ui/material_ui.dart';
import 'package:phone_form_field/country_selector.dart';
import 'package:phone_form_field/phone_form_field.dart';

const MaterialApp(
  locale: Locale('en'),
  supportedLocales: [
    Locale('en'),
  ],
  localizationsDelegates: PhoneFieldLocalization.delegates,
  // ...
)
```

`MaterialApp` is `material_ui`'s rather than the one of `package:flutter/material.dart`,
as the widgets are built on [`material_ui`](https://pub.dev/packages/material_ui)
(decoupled from the framework in Flutter 3.47.0). `PhoneFieldLocalization.delegates`
holds `material_ui`'s `GlobalMaterialLocalizations.delegates`, following the
[material_ui migration guide](https://pub.dev/packages/material_ui#step-2-migrate-localizations-if-needed);
the generated `CountrySelectorLocalization.localizationsDelegates` holds the
`flutter_localizations` ones, which are a different `MaterialLocalizations` type
and throw `No MaterialLocalizations found.` for non english locales.

# Overwriting or adding custom flags

Some users have expressed their need to change some flags due to political reasons, or stylistic reasons. You might also wish to add your own flags. To do so refer to this issue: <https://github.com/cedvdb/phone_form_field/issues/222>

## Development

```sh
git clone https://github.com/cedvdb/flutter_country_selector.git
cd flutter_country_selector
flutter pub get
flutter test

# the example has its own test
cd example && flutter pub get && flutter test
```

This package is a thin re-export, so its tests only smoke test the re-exported
API against the published `phone_form_field`. To try out an unreleased
`phone_form_field` change together with it, point `pubspec.yaml` at a sibling
checkout temporarily:

```yaml
dependency_overrides:
  phone_form_field:
    path: ../phone_form_field
```
