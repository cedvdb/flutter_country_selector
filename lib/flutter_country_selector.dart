/// The country selector has been merged into
/// [phone_form_field](https://pub.dev/packages/phone_form_field).
///
/// The sources, the arbs and the generated localizations now live in
/// `phone_form_field` so that the phone field and the country selector share a
/// single set of sources, a single l10n setup and a single dependency tree
/// (they always shipped together).
///
/// This package is kept as a thin re-export so that existing imports keep
/// working:
///
/// ```dart
/// // still works
/// import 'package:flutter_country_selector/flutter_country_selector.dart';
///
/// // preferred, and the only import you need now
/// import 'package:phone_form_field/country_selector.dart';
/// ```
///
/// Use `PhoneFieldLocalization.delegates` from
/// `package:phone_form_field/phone_form_field.dart` to configure
/// `MaterialApp.localizationsDelegates`: it holds the delegates of `material_ui`
/// (rather than the ones of `flutter_localizations`), which is what the widgets
/// of this package assert against.
library;

export 'package:phone_form_field/country_selector.dart';
