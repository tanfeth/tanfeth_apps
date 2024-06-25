import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/set_location_on_map_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/home/current_location/current_location_fab.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/LocationModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/vm/destination_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/set_location_on_map/vm/set_on_location_map_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/set_location_on_map/widget/search_map_address_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/set_location_on_map/widget/set_location_map_widget.dart';

class SetLocationOnMapView extends ConsumerStatefulWidget {
  const SetLocationOnMapView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SetLocationOnMapView();
}

class _SetLocationOnMapView extends ConsumerState<SetLocationOnMapView> {

  late String pageType;

  @override
  void initState() {
    pageType =Get.parameters[SetLocationOnMapRouting.pageType] ?? '';
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MainAppBar(
        title: LangEnum.selectLocation.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Stack(
            children: [
              SetLocationMapWidget(),

              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 100),
                    child: CurrentLocationDetector(onTap: () async {
                      ref.read(setOnLocationMapProvider.notifier)
                          .getCurrentLocation(setMakers: false);
                    }),
                  ),
                ),
              ),

              Positioned(
                bottom: (MediaQuery.sizeOf(context).height) / 2,
                left: (MediaQuery.sizeOf(context).width - 40) / 2,
                child: Image.asset(
                  pageType == customAppFlavor.commonEnum.locationTypeEnum
                  .pickUp?
                  Images.pickUpImage:
                  Images.destinationMarker,
                  height: 45,
                  width: 45,
                  fit: BoxFit.contain,
                ),
              ),

              SearchMapAddressWidget(),

              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    child: ElevatedButton(
                      onPressed: () async {
                        if(pageType == customAppFlavor.commonEnum.locationTypeEnum
                            .destination){
                          LocationModel model = LocationModel();
                          model.description = ref.read(setOnLocationMapProvider).currentAddress;
                          model.locationCity = ref.read(setOnLocationMapProvider).currentAddressName;
                          model.isFavorite =true;
                          model.placeId = '0';
                          ref.read(destinationListProvider.notifier)
                              .addToList([model]);
                        }else {

                        }

                        Get.back();
                      },
                      child: Text(LangEnum.confirmLocation.tr()),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
