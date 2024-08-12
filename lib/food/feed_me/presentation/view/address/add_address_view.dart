import 'package:api_controller/shared/helper_methods.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/food/common/shared/routes/add_address_route.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/form_validation.dart';

class AddAddressView extends ConsumerStatefulWidget {
  const AddAddressView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddAddressView();
}

class _AddAddressView extends ConsumerState<AddAddressView> {
  final addressDetails = TextEditingController();
  final buildingNumber = TextEditingController();
  final floorNumber = TextEditingController();
  final apartmentNumber = TextEditingController();
  final otherNotes = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String pageType = '';

  @override
  void initState() {
    pageType = Get.parameters[AddAddressRouting.pageType] ?? '';
    if (pageType.isNotEmpty) {
      addressDetails.text = 'العدامه - الدمام - الممكله العربية السعودية';
      buildingNumber.text = '2';
      floorNumber.text = '3';
      apartmentNumber.text = '1';
      otherNotes.text = 'بجوار هايبر اللولو';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title:
            pageType == customAppFlavor.commonEnum.typeAddressByEnum.editAddress
                ? LangEnum.edit.tr()
                : LangEnum.addNewAddress.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 24,
                          ),

                          ///Address description
                          CustomTextFormField(
                              controller: addressDetails,
                              keyboardType: TextInputType.text,
                              hintText: LangEnum.addressDescription.tr(),
                              textInputAction: TextInputAction.next,
                              validator: Validation.notEmpty,
                              prefixIcon: Icons.location_on_rounded,
                              onChanged: (String value) {}),

                          const SizedBox(
                            height: 16,
                          ),

                          ///Building number or name
                          CustomTextFormField(
                              controller: buildingNumber,
                              keyboardType: TextInputType.text,
                              hintText: LangEnum.buildingNumberOrName.tr(),
                              textInputAction: TextInputAction.next,
                              validator: Validation.notEmpty,
                              prefixIcon: Icons.home,
                              onChanged: (String value) {}),

                          const SizedBox(
                            height: 16,
                          ),

                          ///Floor number
                          CustomTextFormField(
                              controller: floorNumber,
                              keyboardType: TextInputType.text,
                              hintText: LangEnum.floorNumber.tr(),
                              textInputAction: TextInputAction.next,
                              validator: Validation.notEmpty,
                              prefixIcon: Icons.home,
                              onChanged: (String value) {}),

                          const SizedBox(
                            height: 16,
                          ),

                          ///Apartment number
                          CustomTextFormField(
                              controller: apartmentNumber,
                              keyboardType: TextInputType.text,
                              hintText: LangEnum.apartmentNumber.tr(),
                              textInputAction: TextInputAction.next,
                              validator: Validation.notEmpty,
                              prefixIcon: Icons.home,
                              onChanged: (String value) {}),

                          const SizedBox(
                            height: 16,
                          ),

                          ///Other notes
                          CustomTextFormField(
                              controller: otherNotes,
                              keyboardType: TextInputType.text,
                              hintText: LangEnum.otherNotes.tr(),
                              textInputAction: TextInputAction.next,
                              validator: Validation.notEmpty,
                              prefixIcon: Icons.edit,
                              onChanged: (String value) {}),

                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          closeKeyBoard();
                        }
                      },
                      child: Text(LangEnum.confirm.tr()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
