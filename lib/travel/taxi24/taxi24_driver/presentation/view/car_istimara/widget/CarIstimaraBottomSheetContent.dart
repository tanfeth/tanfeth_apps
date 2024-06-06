import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tanfeth_apps/common/presentation/widget/photo_source_item_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/picker_helper.dart';

class CaristimaraBottomSheetContent extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CaristimaraBottomSheetContent();


}

class _CaristimaraBottomSheetContent extends ConsumerState<CaristimaraBottomSheetContent>{
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Expanded(
          child: Column(
            children: [
              PhotoSourceItemWidget(
                title: LangEnum.takePhoto.tr(),
                icon: Images.cameraSVG,
                iconWidth: 18,
                iconHeight: 18,
                function: ()async {
                 File? file = await  AppPicker.image(ImageSource.camera);
                  if(file != null){
                    Get.toNamed(page);
                  }
                 Get.back();
                },
              ),
              PhotoSourceItemWidget(
                title: LangEnum.chooseFromGallery.tr(),
                icon: Images.gallerySVG,
                iconWidth: 18,
                iconHeight: 18,
                function: () async{
                  File? file = await  AppPicker.image(ImageSource.gallery);
                  if(file != null){
                    Get.toNamed(page);
                  }

                  viewModel.onImageButtonPressed(context, ImageSource.gallery).then((value) =>
                  value != null ? Navigator.pushNamed(context, RoutePath.carIstimaraConfirmPhotoScreen,arguments:
                  {"image": value,"comeFrom":comeFrom}) : null);
                  Get.back();
                },
              ),
            ],
          ),
        ),

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
      ],
    );
  }

}