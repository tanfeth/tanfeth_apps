


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/pick_image_bottom_sheet.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/shared/extensions/button_extensions.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/confirm_photo_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/driver_data/vm/driver_data_vm.dart';



class ConfirmPhotoView extends ConsumerStatefulWidget{
  const ConfirmPhotoView({super.key});



  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_ConfirmPhotoView();


}

class _ConfirmPhotoView extends ConsumerState<ConfirmPhotoView>{
  late int driverData;

  @override
  void initState() {
    if(Get.arguments != null){
      driverData = Get.arguments[ConfirmPhotoRouting.driverData]?? -1;
    }

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.confirmPhoto.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [

                        20.ph,
                        if(driverData ==
                        customAppFlavor.commonEnum.driverDataEnum.personalPic)...[
                          SizedBox(
                            height: 200,
                            width: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Image.file(
                                File(
                                    ref.watch(taxiDriverDataProvider.notifier)
                                        .bodyUploadDriverAttachmentModel.profileImage?.path??''
                                ),
                                errorBuilder: (context,e,t){
                                  return Image.asset(
                                    Images.user,
                                    fit: BoxFit.fill,
                                    color: context.color.surfaceContainerHighest,
                                  );
                                },
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ]else...[

                        ]

                      ],
                    ),
                  ),
                ),

                Column(
                  children: [
                    ElevatedButton(
                      onPressed: ()async {
                        showLoading();
                        ref.read(taxiDriverDataProvider.notifier)
                        .uploadDriverAttachment();
                        try{
                          await ref.read(
                              ref.read(taxiDriverDataProvider.notifier)
                                  .futureProvider);
                          hideLoading();
                          Get.back();
                        }catch(e){
                          hideLoading();
                          showFailed(msg:e.toString());
                        }
                      },
                      child: Text(LangEnum.confirm.tr()),
                    ),

                    10.ph,


                    ElevatedButton(
                      style: const ButtonStyle().GreyElevatedButton(context),
                      onPressed: () {
                        showBottomSheetFunction(
                          content:  PickImageBottomSheetContent(
                            pickImage: (image){
                              if(image != null){
                              var file =   convertFile(file: image);
                              ref.read(taxiDriverDataProvider.notifier)
                              .setDataModel(file: file, driverData: driverData);
                               setState(() {});
                              }

                            },
                          ),
                        );
                      },
                      child: Text(LangEnum.reTakePhoto.tr()),
                    ),

                    20.ph,

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



}