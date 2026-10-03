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

# Overwriting or adding custom flags

Some users have expressed their need to change some flags due to political reasons, or stylistic reasons. You might also wish to add your own flags. To do so refer to this issue: <https://github.com/cedvdb/phone_form_field/issues/222>

## Development

This package re-exports [phone_form_field](https://github.com/cedvdb/phone_form_field), so it needs its checkout next to this one (see `dependency_overrides` in `pubspec.yaml`):

```sh
git clone https://github.com/cedvdb/phone_form_field.git ../phone_form_field
flutter pub get
flutter test
```

The `dependency_overrides` block can be removed once `phone_form_field` 12.x is published.
