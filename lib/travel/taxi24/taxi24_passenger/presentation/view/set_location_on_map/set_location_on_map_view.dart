import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/complete_trip_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/set_location_on_map_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/home/current_location/current_location_fab.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/LocationModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/vm/destination_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/set_location_on_map/vm/set_on_location_map_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/set_location_on_map/widget/search_map_address_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/set_location_on_map/widget/set_location_map_widget.dart';

class SetLocationOnMapView extends ConsumerStatefulWidget {
  final String? pageType;

  const SetLocationOnMapView({super.key, this.pageType});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SetLocationOnMapView();
}

class _SetLocationOnMapView extends ConsumerState<SetLocationOnMapView> {

  late String pageType;

  @override
  void initState() {
    if(widget.pageType != null){
      pageType = widget.pageType??'';
    }else {
      pageType =Get.parameters[SetLocationOnMapRouting.pageType] ?? '';
    }

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MainAppBar(
        title: pageType == customAppFlavor.commonEnum.locationTypeEnum.destination?
        LangEnum.selectLocation.tr():
        LangEnum.confirmPickUpLocation.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Stack(
            children: [
              SetLocationMapWidget(
                pageType: pageType.isNotEmpty?
                pageType:customAppFlavor.commonEnum.locationTypeEnum.pickUp,
              ),

              // Positioned(
              //   bottom: MySizes.defaultPadding * 5,
              //   right: 0,
              //   left: 0,
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child:  Container(
              //           height: MySizes.buttonHeight * 2.0,
              //           margin: const EdgeInsets.symmetric(
              //             horizontal: MySizes.largePadding,
              //             vertical: 20
              //           ),
              //           padding: const EdgeInsets.symmetric(
              //             horizontal: MySizes.largePadding / 2,
              //             vertical: MySizes.defaultPadding ,
              //           ),
              //           decoration: BoxDecoration(
              //             color: Theme.of(context).colorScheme.primary,
              //             borderRadius: BorderRadius.circular(
              //               MySizes.circleRadius / 10,
              //             ),
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Expanded(
              //                 child: Text(
              //                   ref.watch(setOnLocationMapProvider).currentAddress,
              //                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              //                     color: Theme.of(context).colorScheme.onPrimary,
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),


              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100),
                    child: CurrentLocationDetector(onTap: () async {
                      ref.read(setOnLocationMapProvider.notifier).getCurrentLocation(setMakers: false);
                    }),
                  ),
                ),
              ),

             // bottom: (MediaQuery.sizeOf(context).height-150) / 2,
             // left: (MediaQuery.sizeOf(context).width - 45) / 2,*/

              Positioned(
                bottom: (MediaQuery.sizeOf(context).height) / 2,
                left: (MediaQuery.sizeOf(context).width - 40) / 2,
                child: Image.asset(
                  pageType == customAppFlavor.commonEnum.locationTypeEnum.pickUp?
                  Images.pickUpImage:
                  Images.destinationMarker,
                  height: 45,
                  width: 45,
                  fit: BoxFit.contain,
                ),
              ),

              const SearchMapAddressWidget(),

              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    child: ElevatedButton(
                      onPressed: () async {
                        if(pageType == customAppFlavor.commonEnum.locationTypeEnum
                            .destination){
                          LocationModel model = LocationModel();
                          model.description = ref.read(setOnLocationMapProvider).currentAddress;
                          model.locationCity = ref.read(setOnLocationMapProvider).currentAddressName;
                          model.isFavorite =true;
                          model.placeId = '0';
                          model.latLng = ref.read(setOnLocationMapProvider).currentLatLng;
                          ref.read(destinationListProvider.notifier)
                              .addToList([model]);
                          Get.back();
                        }else {
                          Get.toNamed(CompleteTripRouting.config().path,);
                          // Get.toNamed(ChooseRideRouting.config().path,
                          // arguments: {
                          //   ChooseRideRouting.pickUpLatLng:
                          //   ref.read(setOnLocationMapProvider).currentLatLng
                          // });

                        }


                      },
                      child: Text(
                          pageType == customAppFlavor.commonEnum.locationTypeEnum
                              .destination?
                          LangEnum.confirmLocation.tr():
                          LangEnum.confirmCurrentLocation.tr()
                      ),
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
