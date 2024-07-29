import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:api_controller/shared/picker_helper.dart';
import 'package:api_controller/shared/sizes.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/car_istimara_confirm_photo_route.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/car_istimara/widget/CarIstimaraBottomSheetContent.dart';
import 'package:tanfeth_apps/travel/common/shared/form_validation.dart';

class CarIstimaraConfirmPhotoView extends ConsumerStatefulWidget {
  const CarIstimaraConfirmPhotoView();


  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CarIstimaraConfirmView();
}

class _CarIstimaraConfirmView extends ConsumerState<CarIstimaraConfirmPhotoView> {


  TextEditingController? expiryDateController = TextEditingController();
  late  bool isDisable;
  late  File file;
  late  String pageType;
  late  String image;



  @override
  void initState() {
    image = Get.parameters[CarIstimaraConfirmPhotoRouting.image]??'';
    pageType= Get.parameters[CarIstimaraConfirmPhotoRouting.pageType]??'';
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
            padding: EdgeInsets.all(24),
            child: Column(
              children: [

                Expanded(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: FileImage(
                                File(
                                 image,
                                ),
                              ),
                            )),
                        width: 328,
                        height: 206,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      SizedBox(
                        height: 50,
                        child: CustomTextFormField(
                          validator: Validation.notEmpty,
                          controller: expiryDateController,
                          readOnly: true,
                          hintText: LangEnum.addExpiryDate.tr(),
                          contentPadding: (MySizes.defaultPadding).toAll,
                          onTap: ()async{
                            DateTime? dateTIme = await AppPicker.date(context: context);
                            expiryDateController?.text = dateTIme.toString().split(" ").first;

                            },
                          suffixIcon: Icons.calendar_month_outlined,
                          suffixOnTap: ()async{
                            DateTime? dateTIme = await AppPicker.date(context: context);
                            expiryDateController?.text = dateTIme.toString().split(" ").first;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        LangEnum.useDateWarn.tr(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: context.color.surfaceContainerHighest
                        ),
                      ),
                    ],
                  ),
                ),


                Text(
                    LangEnum.makeSurePhotoDetails.tr(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: context.color.surfaceContainerHighest
                  ),
                ),
                SizedBox(
                  height: 24,
                ),


                Column(
                  children: [
                    ElevatedButton(
                      onPressed: ()async {

                      },
                      child: Text(LangEnum.uploadPhoto.tr()),
                    ),
                    SizedBox(
                      height: 15,
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
                          return null;
                        }
                      },
                      child: Text(LangEnum.reTakePhoto.tr()),
                    ),
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
