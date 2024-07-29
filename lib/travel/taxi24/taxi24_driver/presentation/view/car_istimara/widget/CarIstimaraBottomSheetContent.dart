
import 'dart:io';

import 'package:api_controller/shared/picker_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:tanfeth_apps/common/presentation/widget/photo_source_item_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/car_istimara_confirm_photo_route.dart';

class CaristimaraBottomSheetContent extends ConsumerStatefulWidget{

  final String pageType;
  const CaristimaraBottomSheetContent({super.key, required this.pageType});


  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CaristimaraBottomSheetContent();


}

class _CaristimaraBottomSheetContent extends ConsumerState<CaristimaraBottomSheetContent>{
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          10.ph,
          const Center(child: CloseBottomSheetWidget()),
          10.ph,


          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PhotoSourceItemWidget(
                title: LangEnum.takePhoto.tr(),
                icon: Images.cameraSVG,
                iconWidth: 18,
                iconHeight: 18,
                function: ()async {
                  Get.back();
                  File? file = await  AppPicker.image(ImageSource.gallery);
                  if(file != null){
                    Get.offNamed(CarIstimaraConfirmPhotoRouting.config().path,
                        parameters: {
                          CarIstimaraConfirmPhotoRouting.image:
                          file.path,
                          CarIstimaraConfirmPhotoRouting.pageType:widget.pageType
                        });
                  }
                },
              ),
              PhotoSourceItemWidget(
                title: LangEnum.chooseFromGallery.tr(),
                icon: Images.gallerySVG,
                iconWidth: 18,
                iconHeight: 18,
                function: () async{
                  Get.back();
                  File? file = await  AppPicker.image(ImageSource.gallery);
                  if(file != null){
                    Get.offNamed(CarIstimaraConfirmPhotoRouting.config().path,
                        parameters: {
                          CarIstimaraConfirmPhotoRouting.image:
                          file.path,
                          CarIstimaraConfirmPhotoRouting.pageType:widget.pageType
                        });
                  }
                },
              ),
            ],
          ),

          15.ph,

          Center(
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Text(
                LangEnum.close.tr(),
                style: context.text.titleMedium,
              ),
            ),
          ),

          8.ph,

        ],
      ),
    );
  }

}