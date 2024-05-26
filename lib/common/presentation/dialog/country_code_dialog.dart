import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

void CountryCodeDialog(
    {required BuildContext context,
    required Function(Country country) onSelect}) {
  showCountryPicker(
    context: context,
    countryListTheme: CountryListThemeData(
        backgroundColor: Theme.of(context).colorScheme.background),
    showPhoneCode: true,
    onSelect: onSelect,
  );
}
