
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/car_istimara_route.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/car_istimara/widget/CarIstimaraBottomSheetContent.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/car_istimara/widget/photo_instruction_info.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/taxi24_driver_enum.dart';

class CarIstimaraView extends ConsumerStatefulWidget{
  const CarIstimaraView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _CarIstimaraView();

}

class _CarIstimaraView extends ConsumerState<CarIstimaraView>{

  String pageType = '';

  @override
  void initState() {
    pageType = Get.parameters[CarIstimaraRouting.pageType]??'';
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.vehicleRegistration.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),

                      Text(
                        pageType == CarIstimaraPageType.registration?
                        LangEnum.vehicleRegistration.tr():
                        LangEnum.uploadVehicleInsurance.tr(),
                        style: context.text.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        LangEnum.makeSureTo.tr(),
                        style: context.text.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 16,),
                      PersonalInstructionInfo(
                          title:LangEnum.photoTakenGoodLight.tr()),
                      const SizedBox(height: 16,),
                      PersonalInstructionInfo(
                          title: LangEnum.photoBlurry.tr()),
                      const SizedBox(height: 16,),
                      PersonalInstructionInfo(title:LangEnum.registerVehicle.tr()),
                      const SizedBox(height: 16,),
                      PersonalInstructionInfo(title: LangEnum.acceptDocumentType.tr()),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: ()async {
                   var checked = await  checkCameraPermission();
                   if(checked??false){
                     showBottomSheetFunction(
                       content: CaristimaraBottomSheetContent(
                         pageType: pageType,
                       ),
                     );
                   }else {
                     return;
                   }

                  },
                  child: Text(LangEnum.uploadPhoto.tr()),
                ),
            ],
            ),
          ),
        ),
      ),
    );
  }

}