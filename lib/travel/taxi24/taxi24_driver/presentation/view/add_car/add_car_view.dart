import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/car_detalis_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/car_istimara_route.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/widget/small_divider.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/taxi24_driver_enum.dart';

import '../../../../../common/presentation/widget/profile_item.dart';

class AddCarView extends ConsumerStatefulWidget {
  const AddCarView();
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddCarView();
}

class _AddCarView extends ConsumerState<AddCarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.addNewCar.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 5),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileCell(
                            title: LangEnum.carDetails.tr(),
                            icon: Images.driverCarSVG,
                            iconHeight: 23,
                            iconWidth: 23,
                            function: () {
                              Get.toNamed(CarDetailsRouting.config().path);
                            }),
                        SmallDivider(),
                        ProfileCell(
                            title: LangEnum.vehicleRegistration.tr(),
                            icon: Images.fileSVG,
                            iconHeight: 23,
                            iconWidth: 23,
                            function: () {
                              Get.toNamed(CarIstimaraRouting.config().path,
                              parameters: {
                                CarIstimaraRouting.pageType:CarIstimaraPageType.registration
                              });
                            }),
                        SmallDivider(),
                        ProfileCell(
                            title: LangEnum.vehicleInsurance.tr(),
                            icon: Images.fileSVG,
                            iconHeight: 23,
                            iconWidth: 23,
                            function: () {
                              Get.toNamed(CarIstimaraRouting.config().path,
                                  parameters: {
                                    CarIstimaraRouting.pageType:CarIstimaraPageType.insurance
                                  });
                            }),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {},
                  child: Text(LangEnum.send.tr()),
                ),
                8.ph
              ],
            ),
          ),
        ),
      ),
    );
  }
}
