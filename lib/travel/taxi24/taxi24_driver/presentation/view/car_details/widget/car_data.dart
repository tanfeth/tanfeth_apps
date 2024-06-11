import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/widget/drop_down_search.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/vm/langauge/langauge_vm.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/shared/app_data/car_classification.dart';
import 'package:tanfeth_apps/travel/common/shared/app_data/cars.dart';
import 'package:tanfeth_apps/travel/common/shared/app_data/years.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/ParamCarDetailsModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/car_details/vm/car_details_vm.dart';
import 'package:tanfeth_apps/travel/common/shared/form_validation.dart';

class CarData extends ConsumerStatefulWidget {
  final GlobalKey<FormState>  formKey;
  CarData({required this.formKey});


  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CarData();
}

class _CarData extends ConsumerState<CarData> {
  late List<File> fileList;
  late CarDetailsVM carDetailsVM;
  late ParamCarDetailsModel paramCarDetailsModel;

  final TextEditingController plateNumberController = TextEditingController();
  final TextEditingController plateLetterRightController =
      TextEditingController();
  final TextEditingController plateLetterMiddleController =
      TextEditingController();
  final TextEditingController plateLetterLeftController =
      TextEditingController();
  final TextEditingController sequenceNumberController =
      TextEditingController();
  final TextEditingController colorController = TextEditingController();

  @override
  void initState() {
    fileList = [];
    super.initState();
  }


  initBuild(){
    carDetailsVM = ref.watch(carDetailsProvider.notifier);
    paramCarDetailsModel = ref.watch(carDetailsProvider);
  }


  @override
  Widget build(BuildContext context) {
    initBuild();

    return Form(
      key: widget.formKey,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          /// Cars
          DropDownMenuSearch(
            items: cars
                .map((value) =>
                    value[customAppFlavor.commonEnum.carDataEnum.brand])
                .toList(),
            hint: LangEnum.carType.tr(),
            title: LangEnum.carType.tr(),
            radius: 8,
            selectedItem: paramCarDetailsModel.carType,
            showSearchBox: true,
            validator: (value) =>
                value == null ? LangEnum.selectCarType.tr() : null,
            onChanged: (value) {
              ParamCarDetailsModel model = ParamCarDetailsModel();
              model.carType = value;
              carDetailsVM.setModel(model);
            },
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Car model
              DropDownMenuSearch(
                selectedItem: paramCarDetailsModel.carModel,
                title: LangEnum.carModel.tr(),
                items: paramCarDetailsModel.carType != null
                    ? cars
                        .where((element) =>
                            element[
                                customAppFlavor.commonEnum.carDataEnum.brand] ==
                            paramCarDetailsModel.carType)
                        .map((e) =>
                            e[customAppFlavor.commonEnum.carDataEnum.models])
                        .first as List
                    : [LangEnum.selectCarType.tr()],
                hint: LangEnum.carModel.tr(),
                isDisable: paramCarDetailsModel.carType != null,
                radius: 8,
                validator: (value) =>
                    value == null ? LangEnum.selectCarType.tr() : null,
                onChanged: (value) {
                  ParamCarDetailsModel model = ParamCarDetailsModel();
                  model.carModel = value;
                  model.carType = paramCarDetailsModel.carType;
                  carDetailsVM.setModel(model);
                },
              ),
              paramCarDetailsModel.carType == null
                  ? Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 16),
                      child: Text(
                        LangEnum.selectCarTypeValidator.tr(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: context.color.surfaceContainerHighest),
                      ))
                  : SizedBox(
                      height: 16,
                    ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Model year
              DropDownMenuSearch(
                title: LangEnum.modelYear.tr(),
                selectedItem: paramCarDetailsModel.carYearModel,
                items: years
                    .map((value) =>
                        value[customAppFlavor.commonEnum.carDataEnum.year])
                    .toList(),
                hint: LangEnum.modelYear.tr(),
                isDisable: paramCarDetailsModel.carModel != null,
                radius: 8,
                validator: (value) =>
                    value == null ? LangEnum.selectCarYearModel.tr() : null,
                onChanged: (value) {
                  ParamCarDetailsModel model = ParamCarDetailsModel();
                  model.carYearModel = value;
                  model.carType = paramCarDetailsModel.carType;
                  model.carModel = paramCarDetailsModel.carModel;
                  carDetailsVM.setModel(model);
                },
              ),
              paramCarDetailsModel.carModel == null
                  ? Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 16),
                      child: Text(
                        LangEnum.selectCarModelValidator.tr(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: context.color.surfaceContainerHighest),
                      ))
                  : SizedBox(
                      height: 16,
                    ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Car Classification
              DropDownMenuSearch(
                title: LangEnum.carClassification.tr(),
                selectedItem: paramCarDetailsModel.carSeatType,
                items: carClassification
                    .map((value) => value[ref.watch(languageProvider)])
                    .toList(),
                hint: LangEnum.carClassification.tr(),
                isDisable: paramCarDetailsModel.carYearModel != null,
                radius: 8,
                validator: (value) =>
                    value == null ? LangEnum.selectCarClassification.tr() : null,
                onChanged: (value) {
                  ParamCarDetailsModel model = ParamCarDetailsModel();
                  model.carSeatType = value;
                  model.carType = paramCarDetailsModel.carType;
                  model.carModel = paramCarDetailsModel.carModel;
                  model.carYearModel = paramCarDetailsModel.carYearModel;
                  carDetailsVM.setModel(model);
                },
              ),
              paramCarDetailsModel.carSeatType == null
                  ? Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 16),
                      child: Text(
                        LangEnum.selectCarYearModel.tr(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: context.color.surfaceContainerHighest),
                      ),
                    )
                  : SizedBox(
                      height: 16,
                    ),
            ],
          ),

          ///Plate Number
          CustomTextFormField(
              controller: plateNumberController,
              keyboardType: TextInputType.text,
              hintText: LangEnum.plateNumber.tr(),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z\u0600-\u06FF\s]'),
                ),
                FilteringTextInputFormatter.deny(
                  RegExp('[٠١٢٣٤٥٦٧٨٩؟!؛،٪]'),
                )
              ],
              textInputAction: TextInputAction.next,
              validator: Validation.notEmpty,
              onChanged: (String value) {}),

          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              /// Letter Left
              Expanded(
                child: CustomTextFormField(
                    controller: plateLetterLeftController,
                    keyboardType: TextInputType.text,
                    hintText: LangEnum.letterLeft.tr(),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[a-zA-Z\u0600-\u06FF\s]'),
                      ),
                      FilteringTextInputFormatter.deny(
                        RegExp('[٠١٢٣٤٥٦٧٨٩؟!؛،٪]'),
                      )
                    ],
                    textInputAction: TextInputAction.next,
                    validator: Validation.notEmpty,
                    onChanged: (String value) {}),
              ),
              SizedBox(
                width: 8,
              ),

              /// Letter Middle
              Expanded(
                child: CustomTextFormField(
                    controller: plateLetterMiddleController,
                    keyboardType: TextInputType.text,
                    hintText: LangEnum.middleLetter.tr(),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[a-zA-Z\u0600-\u06FF\s]'),
                      ),
                      FilteringTextInputFormatter.deny(
                        RegExp('[٠١٢٣٤٥٦٧٨٩؟!؛،٪]'),
                      )
                    ],
                    textInputAction: TextInputAction.next,
                    validator: Validation.notEmpty,
                    suffixOnTap: () {},
                    onChanged: (String value) {}),
              ),
              SizedBox(
                width: 8,
              ),

              /// Letter Right
              Expanded(
                child: CustomTextFormField(
                    controller: plateLetterRightController,
                    keyboardType: TextInputType.text,
                    hintText: LangEnum.letterRight.tr(),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[a-zA-Z\u0600-\u06FF\s]'),
                      ),
                      FilteringTextInputFormatter.deny(
                        RegExp('[٠١٢٣٤٥٦٧٨٩؟!؛،٪]'),
                      )
                    ],
                    textInputAction: TextInputAction.next,
                    validator: Validation.notEmpty,
                    onChanged: (String value) {}),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),

          ///Sequence number
          CustomTextFormField(
              controller: sequenceNumberController,
              keyboardType: TextInputType.text,
              hintText: LangEnum.sequenceNumber.tr(),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.deny(
                  RegExp('[٠١٢٣٤٥٦٧٨٩؟!؛،٪]'),
                )
              ],
              textInputAction: TextInputAction.next,
              validator: Validation.notEmpty,
              onChanged: (String value) {}),
          SizedBox(
            height: 16,
          ),

          ///Car color
          CustomTextFormField(
              controller: colorController,
              keyboardType: TextInputType.text,
              hintText: LangEnum.color.tr(),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z\u0600-\u06FF\s]'),
                ),
                FilteringTextInputFormatter.deny(
                  RegExp('[٠١٢٣٤٥٦٧٨٩؟!؛،٪]'),
                )
              ],
              textInputAction: TextInputAction.done,
              validator: Validation.notEmpty,
              onChanged: (String value) {}),

          SizedBox(
            height: 16,
          ),
          Text(
            LangEnum.carPhotos.tr(),
            textAlign: TextAlign.start,
            style: context.text.titleMedium
                ?.copyWith(color: context.color.onSurface),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            LangEnum.uploadFrontAndBackCar.tr(),
            textAlign: TextAlign.start,
            style: TextStyle(color: context.color.surfaceContainerHighest),
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 72,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: fileList.length + 1,
              itemBuilder: (BuildContext context, int index) {
                return (index == 0)
                    ? Visibility(
                        visible: fileList.length < 2,
                        child: GestureDetector(
                          onTap: () {
                            if (fileList.length < 2) {
                            } else {
                              // AppSnackBar.show(context: context, message: "The maximum number of photos allowed is two");
                            }
                          },
                          child: Container(
                              height: 72,
                              width: 72,
                              margin: EdgeInsets.only(right: 16),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          context.color.surfaceContainerHighest,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(8)),
                              child: SvgPicture.asset(Images.plusIconSVG)),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 72,
                          width: 72,
                          margin: EdgeInsets.only(right: 16),
                          alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image:
                                      FileImage(File(fileList[index - 1].path)),
                                  fit: BoxFit.fill)),
                          child: Container(
                              height: 24,
                              width: 24,
                              margin: EdgeInsets.all(4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: context.color.surface,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: SvgPicture.asset(
                                Images.closeSVG,
                                height: 16,
                                width: 16,
                              )),
                        ),
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
