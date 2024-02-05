import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_selector/src/country_selector_base.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

import 'localization/localization.dart';
import 'widgets/_country_list_view.dart';
import 'widgets/_search_box.dart';

/// Same as [CountrySelectorSheet] but designed as a full page
class CountrySelectorPage extends CountrySelectorBase {
  const CountrySelectorPage({
    super.key,
    required super.onCountrySelected,
    super.scrollController,
    super.scrollPhysics,
    super.addFavoritesSeparator = true,
    super.showDialCode = false,
    super.noResultMessage,
    super.favoriteCountries = const [],
    super.countries = IsoCode.values,
    super.searchAutofocus = kIsWeb,
    super.subtitleStyle,
    super.titleStyle,
    super.searchBoxDecoration,
    super.searchBoxTextStyle,
    super.searchBoxIconColor,
    super.flagSize = 40,
  });

  @override
  CountrySelectorPageState createState() => CountrySelectorPageState();
}

class CountrySelectorPageState extends CountrySelectorBaseState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: const Icon(Icons.search),
        shadowColor: Theme.of(context).colorScheme.shadow,
        title: SearchBox(
          autofocus: widget.searchAutofocus,
          onChanged: onSearch,
          onSubmitted: onSubmitted,
          decoration: widget.searchBoxDecoration ??
              InputDecoration(
                border: InputBorder.none,
                hintText: CountrySelectorLocalization.of(context)?.search ??
                    CountrySelectorLocalizationEn().search,
              ),
          style: widget.searchBoxTextStyle,
          searchIconColor: widget.searchBoxIconColor,
        ),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return CountryListView(
            countries: controller.filteredCountries,
            favorites: controller.filteredFavorites,
            showDialCode: widget.showDialCode,
            onTap: (country) => widget.onCountrySelected(country.isoCode),
            flagSize: widget.flagSize,
            scrollController: widget.scrollController,
            scrollPhysics: widget.scrollPhysics,
            noResultMessage: widget.noResultMessage,
            titleStyle: widget.titleStyle,
            subtitleStyle: widget.subtitleStyle,
          );
        },
      ),
    );
  }
}
