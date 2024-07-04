
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/profile_routing.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/home/current_location/current_location_fab.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/LocationModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/widget/choose_ride_map_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/vm/destination_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/vm/pick_up_location_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/vm/toggle_animation_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/widget/footer_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/widget/header_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/set_location_on_map/vm/set_on_location_map_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/set_location_on_map/widget/set_location_map_widget.dart';


class TaxiPassengerHomeView extends ConsumerStatefulWidget {
  const TaxiPassengerHomeView({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PassengerHomeView();
}

class _PassengerHomeView extends ConsumerState<TaxiPassengerHomeView> {



  DateTime backPressDateTime = DateTime.now();


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {


    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        final timeGap = DateTime.now().difference(backPressDateTime);
        final cantExit = timeGap >= const Duration(seconds: 2);
        backPressDateTime = DateTime.now();
        if (cantExit) {
          showToast(LangEnum.pressAgainToExit.tr(), position: ToastPosition.bottom);
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        drawer: Drawer(
          child: ProfileRouting.config().widget,
        ),
        body: WebWidth(
          child: SizedBox(
            child: Stack(
              fit: StackFit.loose,
              children: [

                ///Map
                if(ref.watch(destinationListProvider).isEmpty)...[
                  SetLocationMapWidget(
                    pageType: customAppFlavor.commonEnum.locationTypeEnum.pickUp,
                  ),
                ]else...[
                  ChooseRideMapWidget(),
                ],

                ///Current location
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FadeInUp(
                      animate: ref.watch(toggleAnimationProvider).confirmFooter??false,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 100),
                        child: CurrentLocationDetector(onTap: () async {
                          ref.read(setOnLocationMapProvider.notifier)
                              .getCurrentLocation(setMakers: false);
                        }),
                      ),
                    ),
                  ),
                ),

                ///Marker
                if(ref.watch(destinationListProvider).isEmpty)
                Positioned(
                  bottom: (MediaQuery.sizeOf(context).height) / 2,
                  left: (MediaQuery.sizeOf(context).width - 40) / 2,
                  child: Image.asset(
                    Images.pickUpImage,
                    height: 45,
                    width: 45,
                    fit: BoxFit.contain,
                  ),
                ),

                ///Header
                HeaderWidget(),

                ///Trip footer
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FadeInUp(
                      animate: ref.watch(toggleAnimationProvider).tripFooter??false,
                      child: const FooterWidget(),
                    ),
                  ),
                ),

                ///Confirm button
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FadeInUp(
                      animate: ref.watch(toggleAnimationProvider).confirmFooter??false,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        child: ElevatedButton(
                          onPressed: () async {
                            LocationModel model = LocationModel();
                            model.description = ref.read(setOnLocationMapProvider).currentAddress;
                            model.locationCity = ref.read(setOnLocationMapProvider).currentAddressName;
                            model.isFavorite =true;
                            model.placeId = '0';
                            model.latLng = ref.read(setOnLocationMapProvider).currentLatLng;

                            ref.read(pickUpLocationProvider.notifier)
                                .setModel(model);

                            ref.read(toggleAnimationProvider.notifier)
                                .toggleConfirmFooterAnimate(false);
                            ref.read(toggleAnimationProvider.notifier)
                                .toggleTripFooterAnimate(true);
                          },
                          child: Text(
                              LangEnum.confirm.tr()
                          ),
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }





}
