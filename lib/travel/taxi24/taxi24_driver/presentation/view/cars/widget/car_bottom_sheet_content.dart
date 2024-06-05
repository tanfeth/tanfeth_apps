


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/single_icon_nav_item_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/CarModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/cars/widget/remove_car_bottom_sheet.dart';

class CarBottomSheetContent extends StatelessWidget {
  final CarModel carModel;
  const CarBottomSheetContent({super.key,required this.carModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            10.ph,
            const Center(child: CloseBottomSheetWidget()),
            10.ph,

            Column(
              children: [
                if(!(carModel.isDefault??false))...[
                  SingleIconNavItemWidget(
                    title: LangEnum.setActive.tr(),
                    icon: Images.starSVG,
                    function: () {
                     Get.back();
                    },
                    iconWidth: 20,
                    iconHeight: 19,
                    hasArrow: false,
                  ),
                ],



                SingleIconNavItemWidget(
                  title: LangEnum.viewDocuments.tr(),
                  icon: Images.fileSVG,
                  function: () {},
                  iconWidth: 20,
                  iconHeight: 19,
                  hasArrow: false,
                ),


                SingleIconNavItemWidget(
                  title:LangEnum.removeCar.tr(),
                  icon: Images.deleteIconSVG,
                  function: () {
                    Get.back();
                    showBottomSheetFunction(
                      content:  RemoveCarBottomSheet(carModel: carModel,),
                    );
                  },
                  iconWidth: 20,
                  iconHeight: 19,
                  hasArrow: false,
                ),

              ],
            ),


            Center(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                 Get.back();
                },
                child: Center(
                    child: Text(
                      LangEnum.close.tr(),
                      style: context.text.titleLarge,
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
