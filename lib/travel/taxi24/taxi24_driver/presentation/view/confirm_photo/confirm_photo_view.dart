import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/pick_image_bottom_sheet.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/button_extensions.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/picker_helper.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/form_validation.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/confirm_photo_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/driver/BodyUploadDriverAttachmentModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/driver_data/vm/driver_data_vm.dart';

class ConfirmPhotoView extends ConsumerStatefulWidget {
  const ConfirmPhotoView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConfirmPhotoView();
}

class _ConfirmPhotoView extends ConsumerState<ConfirmPhotoView> {
  late int driverData;

  final expireDateController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (Get.arguments != null) {
      driverData = Get.arguments[ConfirmPhotoRouting.driverData] ?? -1;
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
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          20.ph,
                          if (driverData ==
                              customAppFlavor
                                  .commonEnum.driverDataEnum.personalPic) ...[
                            SizedBox(
                              height: 200,
                              width: 200,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Image.file(
                                  File(ref
                                          .watch(
                                              taxiDriverDataProvider.notifier)
                                          .bodyUploadDriverAttachmentModel
                                          .profileImage
                                          ?.path ??
                                      ''),
                                  errorBuilder: (context, e, t) {
                                    return Image.asset(
                                      Images.user,
                                      fit: BoxFit.fill,
                                      color:
                                          context.color.surfaceContainerHighest,
                                    );
                                  },
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ] else ...[
                            SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.file(
                                  File(
                                    getImageFile(),
                                  ),
                                  errorBuilder: (context, e, t) {
                                    return const Center(
                                      child: Icon(Icons.photo_library_outlined),
                                    );
                                  },
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),

                            20.ph,

                            ///Expire date hijri
                            CustomTextFormField(
                                controller: expireDateController,
                                keyboardType: TextInputType.text,
                                hintText: LangEnum.addExpireDate.tr(),
                                readOnly: true,
                                suffixIcon: Icons.calendar_month,
                                onTap: () async {
                                  await AppPicker.selectHijriDate(
                                      context, expireDateController);
                                },
                                textInputAction: TextInputAction.next,
                                validator: Validation.notEmpty),

                            10.ph,

                            Text(
                              LangEnum.expiryWarning.tr(),
                              style: TextStyle(
                                  color: context.color.surfaceContainerHighest),
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        ref
                            .read(taxiDriverDataProvider.notifier)
                            .bodyUploadDriverAttachmentModel =
                            BodyUploadDriverAttachmentModel();

                        if (driverData ==
                            customAppFlavor
                                .commonEnum.driverDataEnum.personalPic) {
                          uploadAttachment();
                        } else {
                          if (formKey.currentState!.validate()) {

                            if (driverData ==
                                customAppFlavor
                                    .commonEnum.driverDataEnum.saudiID) {
                              ref
                                      .read(taxiDriverDataProvider.notifier)
                                      .bodyUploadDriverAttachmentModel
                                      .saudiIdExpiryDate =
                                  formatDateTime(
                                      dateTime: expireDateController.text);
                            } else if (driverData ==
                                customAppFlavor
                                    .commonEnum.driverDataEnum.drivingLicence) {
                              ref
                                      .read(taxiDriverDataProvider.notifier)
                                      .bodyUploadDriverAttachmentModel
                                      .licenceExpiryDate =
                                  formatDateTime(
                                      dateTime: expireDateController.text);
                            } else if (driverData ==
                                customAppFlavor.commonEnum.driverDataEnum
                                    .vehicleRegistration) {
                            } else {}

                            ///Call api
                            uploadAttachment();
                          }
                        }
                      },
                      child: Text(LangEnum.confirm.tr()),
                    ),
                    10.ph,
                    ElevatedButton(
                      style: const ButtonStyle().GreyElevatedButton(context),
                      onPressed: () {
                        showBottomSheetFunction(
                          content: PickImageBottomSheetContent(
                            pickImage: (image) {
                              if (image != null) {
                                var file = convertFile(file: image);
                                ref
                                    .read(taxiDriverDataProvider.notifier)
                                    .setDataModel(
                                        file: file, driverData: driverData);
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

  String getImageFile() {
    if (driverData == customAppFlavor.commonEnum.driverDataEnum.saudiID) {
      return ref
              .read(taxiDriverDataProvider.notifier)
              .bodyUploadDriverAttachmentModel
              .saudiId
              ?.path ??
          '';
    } else if (driverData ==
        customAppFlavor.commonEnum.driverDataEnum.drivingLicence) {
      return ref
              .read(taxiDriverDataProvider.notifier)
              .bodyUploadDriverAttachmentModel
              .license
              ?.path ??
          '';
    } else if (driverData ==
        customAppFlavor.commonEnum.driverDataEnum.vehicleRegistration) {
      return '';
    } else {
      return '';
    }
  }

  void uploadAttachment() async {
    showLoading();
    ref.read(taxiDriverDataProvider.notifier).
    uploadDriverAttachment();
    try {
      await ref.read(ref.read(taxiDriverDataProvider.notifier).
      futureProvider);
      hideLoading();
      Get.back();
      showSuccess(msg: LangEnum.imageUploadedSuccessfully.tr());
    } catch (e) {
      hideLoading();
      showFailed(msg: e.toString());
    }
  }
}
