import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/food/common/shared/routes/add_address_route.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/home/current_location/current_location_fab.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/set_location_on_map/vm/set_on_location_map_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/set_location_on_map/widget/search_map_address_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/set_location_on_map/widget/set_location_map_widget.dart';

class FeedMeMapView extends ConsumerStatefulWidget {
  const FeedMeMapView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeedMeMapView();
}

class _FeedMeMapView extends ConsumerState<FeedMeMapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MainAppBar(
        title: LangEnum.selectLocation.tr(),
        leadingWidget: const BackButtonWidget(),
        appBarColor: context.color.primary,
      ),
      body: WebWidth(
        child: SafeArea(
          child: Stack(
            children: [
              SetLocationMapWidget(
                pageType:
                    customAppFlavor.commonEnum.locationTypeEnum.destination,
              ),

              ///Current location
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100),
                    child: CurrentLocationDetector(onTap: () async {
                      ref
                          .read(setOnLocationMapProvider.notifier)
                          .getCurrentLocation(setMakers: false);
                    }),
                  ),
                ),
              ),

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

              const SearchMapAddressWidget(),

              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: ElevatedButton(
                      onPressed: () async {
                        Get.toNamed(AddAddressRouting.config().path);
                      },
                      child: Text(LangEnum.continueWord.tr()),
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
