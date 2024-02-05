import 'package:flutter/material.dart';
import 'package:flutter_country_selector/src/localization/localization.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

import '_country_finder.dart';
import '_localized_country.dart';

class CountrySelectorController with ChangeNotifier {
  final _finder = CountryFinder();
  List<LocalizedCountry> _countries = [];
  List<LocalizedCountry> _filteredCountries = [];
  List<LocalizedCountry> _favoriteCountries = [];
  List<LocalizedCountry> _filteredFavoriteCountries = [];

  List<LocalizedCountry> get filteredCountries => _filteredCountries;
  List<LocalizedCountry> get filteredFavorites => _filteredFavoriteCountries;

  CountrySelectorController(
    BuildContext context,
    List<IsoCode> countriesIsoCode,
    List<IsoCode> favoriteCountriesIsoCode,
  ) {
    _countries = _buildLocalizedCountryList(context, countriesIsoCode);
    _favoriteCountries =
        _buildLocalizedCountryList(context, favoriteCountriesIsoCode);
    _filteredCountries = _countries;
  }

  void search(String searchedText) {
    _filteredCountries = _finder.whereText(
      text: searchedText,
      countries: _countries,
    );
    _filteredFavoriteCountries = _finder.whereText(
      text: searchedText,
      countries: _favoriteCountries,
    );
    notifyListeners();
  }

  LocalizedCountry? findFirst() {
    if (_filteredFavoriteCountries.isNotEmpty) {
      return _filteredFavoriteCountries.first;
    } else if (_filteredCountries.isNotEmpty) {
      return _filteredCountries.first;
    }
    return null;
  }

  List<LocalizedCountry> _buildLocalizedCountryList(
    BuildContext context,
    List<IsoCode> isoCodes,
  ) {
    // we need the localized names in order to search
    final localization = CountrySelectorLocalization.of(context) ??
        CountrySelectorLocalizationEn();
    return isoCodes
        .map((isoCode) =>
            LocalizedCountry(isoCode, localization.countryName(isoCode)))
        .toList()
      ..sort((a, b) => a.name.compareTo(b.name));
  }
}
