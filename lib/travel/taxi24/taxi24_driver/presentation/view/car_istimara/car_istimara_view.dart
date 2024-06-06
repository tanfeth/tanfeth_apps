
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/car_istimara/widget/CarIstimaraBottomSheetContent.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/car_istimara/widget/photo_instruction_info.dart';

class CarIstimaraView extends ConsumerStatefulWidget{
  const CarIstimaraView();
  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _CarIstimaraView();

}

class _CarIstimaraView extends ConsumerState<CarIstimaraView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.vehicleRegistration.tr(),
        leadingWidget: const BackButton(),
      ),
      body: WebWidth(
        child: SafeArea(
          child:Padding(
            padding: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),

                      Text(
                        LangEnum.vehicleRegistration.tr(),
                        style: context.text.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        LangEnum.makeSureTo.tr(),
                        style: context.text.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 16,),
                      PersonalInstructionInfo(
                          title:LangEnum.photoTakenGoodLight.tr()),
                      SizedBox(height: 16,),
                      PersonalInstructionInfo(
                          title: LangEnum.photoBlurry.tr()),
                      SizedBox(height: 16,),
                      PersonalInstructionInfo(title:LangEnum.registerVehicle.tr()),
                      SizedBox(height: 16,),
                      PersonalInstructionInfo(title: LangEnum.acceptDocumentType.tr()),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: ()async {
                   var checked = await  checkCameraPermission();
                   if(checked??false){
                     showBottomSheetFunction(
                       content: CaristimaraBottomSheetContent(),
                     );
                   }else {
                     return null;
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