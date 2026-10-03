import 'package:flutter_country_selector/flutter_country_selector.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phone_form_field/phone_form_field.dart';

/// `flutter_country_selector` is a re-export of
/// `package:phone_form_field/country_selector.dart`. This test exercises that
/// surface so the build breaks as soon as the re-exported api drifts.
void main() {
  testWidgets('Should re-export a working country selector', (tester) async {
    IsoCode? selected;

    final selector = CountrySelector.page(
      onCountrySelected: (country) => selected = country,
      favoriteCountries: const [IsoCode.BE],
      scrollPhysics: const ClampingScrollPhysics(),
      showDialCode: true,
      noResultMessage: 'Nothing found',
      searchAutofocus: false,
      subtitleStyle: const TextStyle(),
      titleStyle: const TextStyle(),
      searchBoxDecoration: const InputDecoration(),
      searchBoxTextStyle: const TextStyle(),
      searchBoxIconColor: const Color(0xFF000000),
      flagSize: 32,
    );

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        supportedLocales: const [Locale('en')],
        // Hint: prefer PhoneFieldLocalization.delegates over
        // CountrySelectorLocalization.localizationsDelegates, which holds the
        // `flutter_localizations` delegates rather than the material_ui ones.
        localizationsDelegates: PhoneFieldLocalization.delegates,
        home: Scaffold(body: selector),
      ),
    );
    await tester.pumpAndSettle();

    // CountrySelectorLocalization is kept as an alias of the phone_form_field
    // implementation, so both `.of(context)` and `.delegate` keep resolving.
    expect(CountrySelectorLocalization.delegate, isNotNull);
    expect(
      CountrySelectorLocalization.of(
        tester.element(find.byType(CountrySelectorPage)),
      ),
      isNotNull,
    );

    // IsoCode is re-exported from phone_numbers_parser.
    expect(IsoCode.values, isNotEmpty);

    await tester.tap(find.byType(ListTile).first);
    await tester.pumpAndSettle();
    expect(selected, isNotNull);
  });

  test('Should re-export CountrySelector.sheet', () {
    expect(
      CountrySelector.sheet(onCountrySelected: (country) {}),
      isA<CountrySelectorSheet>(),
    );
  });
}
