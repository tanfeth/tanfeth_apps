import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';

class CountryCodeWidget extends ConsumerWidget {
  final Function(Country country) onSelect;
  final Country selectedPhoneCountry;

  const CountryCodeWidget(
      {super.key, required this.onSelect, required this.selectedPhoneCountry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 100,
      child: GestureDetector(
        onTap: () {
          showCountryPicker(
            context: context,
            countryListTheme: CountryListThemeData(
                backgroundColor: Theme.of(context).colorScheme.surface),
            showPhoneCode: true,
            onSelect: onSelect,
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 5,
            ),
            Icon(
              Icons.arrow_drop_down,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(countryFlag(countryCode: selectedPhoneCountry.countryCode)),
            const SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                selectedPhoneCountry.phoneCode,
                style: context.text.titleSmall,
              ),
            ),
            Container(
              height: 20,
              width: 0.3,
              color: Theme.of(context).colorScheme.primary,
              margin: const EdgeInsets.symmetric(horizontal: 5),
            ),
          ],
        ),
      ),
    );
  }
}
