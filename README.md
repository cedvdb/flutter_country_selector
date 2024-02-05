# Flutter Country Selector

Country selector of the phone_form_field package exported in its own package.

## Features

  - localization: lots of supported languages
  - semantics applied

## Demo

Demo available here: https://cedvdb.github.io/flutter_country_selector/


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

Use `CountrySelectorLocalization.countryName(isoCode)` when you need to dynamically localize the name of a country.

### Supported languages

  - ar
  - de
  - el
  - en
  - es
  - fa
  - fr
  - hi
  - it
  - ku
  - nb
  - nl
  - pt
  - ru
  - sv
  - tr
  - uk
  - uz
  - zh  

### Setup

Example setup:

```dart

const MaterialApp(
  locale: Locale('en'),
  supportedLocales: [
    Locale('en'),
  ],
  localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    CountrySelectorLocalization.delegate,
  ],
  // ...
)
```

