import 'package:flutter_country_selector/flutter_country_selector.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('The example builds the country selector', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        supportedLocales: const [Locale('en')],
        localizationsDelegates: const [
          ...GlobalMaterialLocalizations.delegates,
          CountrySelectorLocalization.delegate,
        ],
        home: Scaffold(
          body: CountrySelector.page(onCountrySelected: (country) {}),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(CountrySelectorPage), findsOneWidget);
    expect(find.byType(ListTile), findsWidgets);
  });
}
