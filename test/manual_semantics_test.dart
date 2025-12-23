
import 'package:flutter/material.dart';
import 'package:flutter_country_selector/flutter_country_selector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Manual Semantics Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Country Selector Demo'),
          ),
          body: Center(
            child: CountrySelector.page(
              onCountrySelected: (country) {
                // Handle country selection
              },
            ),
          ),
        ),
      ),
    );

    // Enable semantics
    final SemanticsHandle semantics = tester.ensureSemantics();

    // The test will pause here, allowing for manual interaction.
    await tester.pumpAndSettle(const Duration(seconds: 10));
    // debugDumpApp();
    // Manually verify that the search box is focusable and that you can type in it.

    // Dispose of the semantics handle
    semantics.dispose();
  });
}
