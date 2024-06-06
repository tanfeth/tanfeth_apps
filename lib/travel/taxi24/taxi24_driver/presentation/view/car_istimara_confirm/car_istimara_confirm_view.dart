import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';

class CarIstimaraConfirmView extends ConsumerStatefulWidget {

   final bool isDisable;
   final File file;
   final String comeFrom;

  CarIstimaraConfirmView(
      {required this.comeFrom,
      required this.file,
      this.isDisable = true,});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CarIstimaraConfirmView();
}

class _CarIstimaraConfirmView extends ConsumerState<CarIstimaraConfirmView> {


  TextEditingController? expiryDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.confirmPhoto.tr(),
        leadingWidget: const BackButton(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [

                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: FileImage(
                                  File(
                                    widget.file.path,
                                  ),
                                ),
                              )),
                          width: 328,
                          height: 206,
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Expanded(
                          child:
                          MyTextFormField(
                            noPadding: true,
                            readOnly: true,
                            validator: (value) {},
                            onTap: () {
                              viewModel.selectDate(context, _expiryDateController).then(
                                      (value) => isDisable =
                                      viewModel.checkValue(_expiryDateController.text));
                            },
                            controller: _expiryDateController,
                            hintText: "Add Expiry Date",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                viewModel
                                    .selectDate(context, _expiryDateController)
                                    .then((value) => isDisable = viewModel
                                    .checkValue(_expiryDateController.text));
                              },
                              child: const Icon(
                                Icons.calendar_month_outlined,
                                color: ColorsManager.greyColor757575,
                              ),
                            ),
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
                    BlocConsumer<CarPhotoViewModel, CarPhotoStates>(
                      listener: (context, state) {
                        if (state is UploadCarDocumentSuccessState) {
                          if (comeFrom == "DriverDataScreen") {
                            Navigator.pushNamedAndRemoveUntil(context,
                                RoutePath.driverDataScreen, (route) => false);
                          } else if (comeFrom == "AddNewCarScreen") {
                            Navigator.pushNamedAndRemoveUntil(context,
                                RoutePath.addNewCarScreen, (route) => false,
                                arguments: {
                                  "carId": getIt<CarDetailsViewModel>()
                                      .addCarEntity
                                      ?.carId
                                });
                          }
                        } else if (state is UploadCarDocumentErrorState) {
                          AppSnackBar.show(
                              context: context,
                              message:
                                  "An error occurred, please try again".tr());
                        }
                      },
                      builder: (context, state) {
                        return PrimaryButton(
                          noPadding: true,
                          text: "Upload Photo".tr(),
                          isDisable: isDisable,
                          isLoading: state is UploadCarDocumentLoadingState,
                          onPressed: () async {
                            if (getIt<CarDetailsViewModel>()
                                        .addCarEntity
                                        ?.carId !=
                                    null ||
                                getIt<DriverDataViewModel>()
                                        .checkDriverDataEntity
                                        ?.carId !=
                                    null) {
                              viewModel.uploadCarDocument({
                                "VehicalRegistration":
                                    await MultipartFile.fromFile(file.path,
                                        filename: file.path.split('/').last),
                                "VehicalRegistrationExpiryDate":
                                    _expiryDateController.text,
                                "CarId": getIt<CarDetailsViewModel>()
                                        .addCarEntity
                                        ?.carId ??
                                    getIt<DriverDataViewModel>()
                                        .checkDriverDataEntity
                                        ?.carId
                              });
                            } else {
                              AppSnackBar.show(
                                  context: context,
                                  message: "Please enter vehicle details first"
                                      .tr());
                            }
                          },
                          color: ColorsManager.baseOrange,
                          colorText: ColorsManager.blackColor,
                        );
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    PrimaryButton(
                      noPadding: true,
                      text: "Retake photo".tr(),
                      onPressed: () {
                        checkCameraPermission().then((value) => value == true
                            ? showCustomBottomSheetMenu(
                                context: context,
                                height: 200.h,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    PhotoSourceItemWidget(
                                      title: 'Take a photo'.tr(),
                                      icon: AssetsManager.cameraSVG,
                                      iconWidth: 20.w,
                                      iconHeight: 18.h,
                                      function: () {
                                        viewModel
                                            .onImageButtonPressed(
                                                context, ImageSource.camera)
                                            .then((value) => value != null
                                                ? file = value
                                                : null);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    PhotoSourceItemWidget(
                                      title: 'Choose from gallery'.tr(),
                                      icon: AssetsManager.gallerySVG,
                                      iconWidth: 18.w,
                                      iconHeight: 18.h,
                                      function: () {
                                        viewModel
                                            .onImageButtonPressed(
                                                context, ImageSource.gallery)
                                            .then((value) => value != null
                                                ? file = value
                                                : null);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    const Spacer(),
                                    Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: CustomText(
                                          text: "Close".tr(),
                                          fontSize: FontSizer.s18,
                                          fontWeight: FontWeightManager.large,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    )
                                  ],
                                ),
                              )
                            : null);
                      },
                      color: ColorsManager.whiteColor,
                      colorText: ColorsManager.blackColor,
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
