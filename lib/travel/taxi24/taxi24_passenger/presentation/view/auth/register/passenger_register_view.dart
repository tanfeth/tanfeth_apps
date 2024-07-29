import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/presentation/widget/country_code/country_code_widget.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/select_city_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/terms_service_route.dart';
import 'package:tanfeth_apps/travel/common/shared/form_validation.dart';

class PassengerRegisterView extends ConsumerStatefulWidget {
  const PassengerRegisterView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PassengerRegisterView();
}

class _PassengerRegisterView extends ConsumerState<PassengerRegisterView> {
  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Country selectedMobile = getCountry();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.registerNow.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LangEnum.enterDetails.tr(),
                            style: context.text.titleMedium,
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 24,
                          ),

                          ///Full name
                          CustomTextFormField(
                              controller: userNameController,
                              keyboardType: TextInputType.text,
                              hintText: LangEnum.fullname.tr(),
                              textInputAction: TextInputAction.next,
                              validator: Validation.notEmpty,
                              onChanged: (String value) {}),

                          const SizedBox(
                            height: 16,
                          ),

                          SelectCityWidget(),

                          const SizedBox(
                            height: 16,
                          ),

                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: CustomTextFormField(
                                keyboardType: TextInputType.phone,
                                hintText: LangEnum.numPhone.tr(),
                                textInputAction: TextInputAction.next,
                                validator: customAppFlavor.defaultCountryCode ==
                                        'SA'
                                    ? Validation.phone
                                    : Validation.notEmpty,
                                maxLength:
                                    customAppFlavor.defaultCountryCode == 'SA'
                                        ? 9
                                        : null,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                suffixWidget: CountryCodeWidget(
                                  onSelect: (Country country) {
                                    selectedMobile = country;
                                    setState(() {});
                                  },
                                  selectedPhoneCountry: selectedMobile,
                                ),
                                onChanged: (String value) {
                                  if (value.length == 9) {
                                    closeKeyBoard();
                                  }
                                }),
                          ),

                          const SizedBox(
                            height: 16,
                          ),

                          ///Email
                          CustomTextFormField(
                              controller: userEmailController,
                              keyboardType: TextInputType.text,
                              hintText: LangEnum.email.tr(),
                              textInputAction: TextInputAction.next,
                              validator: Validation.email,
                              onChanged: (String value) {}),

                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        closeKeyBoard();
                        Get.toNamed(TermsOfServiceRouting.config().path);
                      }
                    },
                    child: Text(LangEnum.continueWord.tr()),
                  ),
                  const SizedBox(
                    height: 20,
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
