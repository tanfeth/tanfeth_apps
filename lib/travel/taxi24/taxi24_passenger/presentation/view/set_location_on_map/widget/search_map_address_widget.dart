
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/vm/langauge/langauge_vm.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/src/google_api_headers.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/set_location_on_map/vm/set_on_location_map_vm.dart';


class SearchMapAddressWidget extends ConsumerStatefulWidget{
  const SearchMapAddressWidget();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchMapAddressWidget();

}

class _SearchMapAddressWidget extends ConsumerState<SearchMapAddressWidget>{


  TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,
      vertical: 20),
      child:  CustomTextFormField(
          readOnly: true,
          controller: searchController,
          fillColor: context.color.surface,
          onTap: (){
            handlePressButton();
          },
          keyboardType: TextInputType.text,
          prefixIcon: Icons.search,
          hintText: LangEnum.search.tr()),
    );
  }



  Future<Null> displayPrediction({required Prediction? prediction}) async {
    if (prediction != null) {
      GoogleMapsPlaces _places = GoogleMapsPlaces(
        apiKey: customAppFlavor.mapApiKey,
        apiHeaders: await GoogleApiHeaders().getHeaders(),
      );
      PlacesDetailsResponse detail =
      await _places.getDetailsByPlaceId(prediction.placeId??'');
      final lat = detail.result.geometry?.location.lat;
      final lng = detail.result.geometry?.location.lng;
      searchController.text = detail.result.name;
      ref.read(setOnLocationMapProvider.notifier).getAddressFromLatLong(
        lat: lat,
        long: lng
      );

      ref.read(setOnLocationMapProvider.notifier).animateCameraPosition(
          currentPosition:  LatLng(lat??0.0, lng??0.0),
          zoom: 15
      );
    }
  }

  Future<void> handlePressButton() async {
    Prediction? prediction = await PlacesAutocomplete.show(
      context: context,
      apiKey: customAppFlavor.mapApiKey,
      overlayBorderRadius: BorderRadius.all(
        Radius.circular(10)
      ),
      logo: SizedBox.shrink(),
      mode: Mode.overlay,
      types: [],
      language: ref.watch(languageProvider),
      decoration: InputDecoration(
          suffixIconConstraints: BoxConstraints(maxWidth: 60),
          hintText: LangEnum.search.tr()),
      components: [],
      strictbounds: false,
    );

    displayPrediction(prediction:prediction);
  }


}