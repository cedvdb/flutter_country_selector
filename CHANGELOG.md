## 3.0.0

- **[Breaking]** The country selector has been merged into
  [phone_form_field](https://pub.dev/packages/phone_form_field). The sources,
  the arbs, the generated localizations and the tests now live there so that the
  phone field and the country selector share a single set of sources, a single
  l10n setup and a single dependency tree (they always shipped together). This
  package is now a thin re-export of
  `package:phone_form_field/country_selector.dart`:
  `import 'package:flutter_country_selector/flutter_country_selector.dart';`
  keeps working, `import 'package:phone_form_field/country_selector.dart';` is
  preferred.
- **[Breaking]** Requires `phone_form_field: ^12.0.0`.
- `CountrySelectorLocalization` and `CountrySelectorLocalizationEn` are now
  aliases of `PhoneFieldLocalizationImpl` and `PhoneFieldLocalizationImplEn`,
  so `.delegate`, `.of(context)`, `.supportedLocales` and the country names
  extension keep working.
- Use `PhoneFieldLocalization.delegates` to wire
  `MaterialApp.localizationsDelegates`. `CountrySelectorLocalization
  .localizationsDelegates` still exists but now holds the
  `flutter_localizations` delegates rather than the `material_ui` ones.

## 2.0.4

- Add Romanian localization
- Added missing Japanese and Thai translations

## 2.0.3

- Use deferred imports for localizations


## 2.0.2

- Fix Spanish country name translations (China, Turkey, Togo, Isle of Man, Jordan, Guyana, Libya, Iran, French Polynesia and others were mistranslated or misspelled)

## 2.0.1

- Bump version

## 2.0.0

- [Breaking]: Require dart >=3.5.0
- [Breaking]: Require flutter >=3.47.0
- Migrate to the new material_ui package which has been decoupled from the flutter framework in flutter 3.47.0

## 1.0.19

- Semantics fix for search field

## 1.0.18

- Add Polish localization

## 1.0.17+1

* Auto publish workflow implemented

## 1.0.17

* Fix a memory leak in the CountrySelectorBase widget

## 1.0.16

* Use theme default for `AppBar` elevation.

## 1.0.15

* Added fix for Hebrew localization

## 1.0.14

* Add Catalan

## 1.0.13

* Add localizations for Urdu

## 1.0.12

* Fix translation in Vietnamese
* Add localizations for Hebrew
* Upgrade dependency

## 1.0.11

* Added localizations for vi

## 1.0.10

* Added localizations for Korean

## 1.0.9

* Fix translation in Portuguese

## 1.0.8

* Fix translation el
* Update readme

## 1.0.7

* Fix missing localizations
* Use newer version of circle_flags
* Add readme note about overwriting flags

## 1.0.6

* Added localizations for hu
* Fixed fr localizations

## 1.0.5

* Added missing localizations for pt and ru
* Upgraded phone_numbers_parser

## 1.0.4

* Improve accessibility

## 1.0.3

* Update demo gif

## 1.0.2

* Add `countryDialCode` method to `CountrySelectorLocalization`

## 1.0.1

* Add demo gif

## 1.0.0

* Initial release
