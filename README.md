# Flutter Country Selector

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

# Overwriting or adding custom flags

Some users have expressed their need to change some flags due to political reasons, or stylistic reasons. You might also wish to add your own flags. To do so refer to this issue: <https://github.com/cedvdb/phone_form_field/issues/222>
