import 'package:flutter/material.dart';
import 'package:flutter_country_selector/flutter_country_selector.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        locale: Locale('en'),
        supportedLocales: [
          Locale('en'),
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          CountrySelectorLocalization.delegate,
        ],
        home: DemoPage(),
      );
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  NavigationType navigationType = NavigationType.page;
  bool showDialCode = true;
  bool containsFavorite = false;

  @override
  initState() {
    super.initState();
    CountrySelector.preloadFlags();
  }

  show(BuildContext context) {
    switch (navigationType) {
      case NavigationType.page:
        return Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => buildSelectorPage(),
          ),
        );
      case NavigationType.dialog:
        return showDialog(
          context: context,
          builder: (_) => Dialog(
            child: buildSelectorSheet(),
          ),
        );
      case NavigationType.draggableBottomSheet:
        return showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          builder: (_) => DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.25,
            maxChildSize: 0.85,
            expand: false,
            builder: (context, scrollController) {
              return buildSelectorSheet();
            },
          ),
          isScrollControlled: true,
        );
      case NavigationType.modalBottomSheet:
        return showModalBottomSheet(
          context: context,
          builder: (_) => SizedBox(
            height: MediaQuery.of(context).size.height - 90,
            child: buildSelectorSheet(),
          ),
          isScrollControlled: true,
        );
      case NavigationType.bottomSheet:
        return showBottomSheet(
          context: context,
          builder: (_) => MediaQuery(
            data: MediaQueryData.fromView(View.of(context)),
            child: SafeArea(
              child: buildSelectorSheet(),
            ),
          ),
        );
    }
  }

  Widget buildSelectorPage() {
    return CountrySelector.page(
      onCountrySelected: (country) => Navigator.of(context).pop(country),
      favoriteCountries: containsFavorite ? [IsoCode.US] : [],
      showDialCode: showDialCode,
    );
  }

  Widget buildSelectorSheet() {
    return CountrySelector.sheet(
      onCountrySelected: (country) => Navigator.of(context).pop(country),
      addFavoritesSeparator: true,
      favoriteCountries: containsFavorite ? [IsoCode.US] : [],
      showDialCode: showDialCode,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SwitchListTile(
                    value: showDialCode,
                    onChanged: (v) => setState(() => showDialCode = v),
                    title: const Text('Show dial code'),
                  ),
                  SwitchListTile(
                    value: containsFavorite,
                    onChanged: (v) => setState(() => containsFavorite = v),
                    title: const Text('Contains favorites'),
                  ),
                  ListTile(
                    title: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Text('Country selector: '),
                        NavigationTypeDropdown(
                          onChange: (type) =>
                              setState(() => navigationType = type),
                          value: navigationType,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () => show(context),
                      child: const Text('Show')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum NavigationType {
  page,
  dialog,
  draggableBottomSheet,
  modalBottomSheet,
  bottomSheet,
}

class NavigationTypeDropdown extends StatelessWidget {
  final Function(NavigationType) onChange;
  final NavigationType value;
  const NavigationTypeDropdown({
    super.key,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<NavigationType>(
      value: value,
      onChanged: (NavigationType? value) {
        if (value != null) {
          onChange(value);
        }
      },
      items: const [
        DropdownMenuItem(
          value: NavigationType.page,
          child: Text('Page'),
        ),
        DropdownMenuItem(
          value: NavigationType.dialog,
          child: Text('Dialog'),
        ),
        DropdownMenuItem(
          value: NavigationType.draggableBottomSheet,
          child: Text('Draggable modal sheet'),
        ),
        DropdownMenuItem(
          value: NavigationType.modalBottomSheet,
          child: Text('Modal sheet'),
        ),
        DropdownMenuItem(
          value: NavigationType.bottomSheet,
          child: Text('Bottom sheet'),
        ),
      ],
    );
  }
}
