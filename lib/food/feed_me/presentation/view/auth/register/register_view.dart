


import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/helper_methods.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/presentation/widget/country_code/country_code_widget.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/auth_routing/verify_route.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/auth/register/vm/register_password_vm.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/form_validation.dart';

class FeedMeRegisterView extends ConsumerStatefulWidget{
  const FeedMeRegisterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_FeedMeRegisterView();


}

class _FeedMeRegisterView extends ConsumerState<FeedMeRegisterView>{


  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Country selectedCountry = getCountry();


  initBuild(){

  }


  @override
  Widget build(BuildContext context) {
    initBuild();

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
                      child:LayoutBuilder(builder: (context,constraints){
                        return  SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(minWidth: constraints.maxWidth,
                                minHeight: constraints.maxHeight),
                            child: IntrinsicHeight(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [

                                  const SizedBox(height: 24,),


                                  Text(
                                    LangEnum.enterDetails.tr(),
                                    style: context.text.titleMedium,
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(height: 24,),

                                  ///First name
                                  CustomTextFormField(
                                      controller: firstNameController,
                                      keyboardType: TextInputType.text,
                                      hintText: LangEnum.firstName.tr(),
                                      textInputAction: TextInputAction.next,
                                      validator: Validation.notEmpty,
                                      onChanged: (String value) {}),

                                  const SizedBox(height:16,),


                                  ///Last name
                                  CustomTextFormField(
                                      controller: lastNameController,
                                      keyboardType: TextInputType.text,
                                      hintText: LangEnum.lastName.tr(),
                                      textInputAction: TextInputAction.next,
                                      validator: Validation.notEmpty,
                                      onChanged: (String value) {}),

                                  const SizedBox(height:16,),

                                  ///Phone number
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: CustomTextFormField(
                                        keyboardType: TextInputType.phone,
                                        hintText: LangEnum.numPhone.tr(),
                                        controller: phoneController,
                                        textInputAction: TextInputAction.next,
                                        validator: customAppFlavor.defaultCountryCode == 'SA'?
                                        Validation.phone:Validation.notEmpty,
                                        maxLength: customAppFlavor.defaultCountryCode == 'SA'?
                                        9:null,
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                        suffixWidget: CountryCodeWidget(
                                          onSelect: (Country country) {
                                            selectedCountry = country;
                                            setState(() {});
                                          },
                                          selectedPhoneCountry: selectedCountry,
                                        ),
                                        onChanged: (String value) {
                                          if(selectedCountry.phoneCode == '966'){
                                            if(value.length == 9){
                                              closeKeyBoard();
                                            }
                                          }

                                        }),
                                  ),

                                  const SizedBox(height:16,),

                                  ///Password
                                  CustomTextFormField(
                                    hintText: LangEnum.newPassword.tr(),
                                    prefixIcon: LineIcons.lock,
                                    validator: Validation.password,
                                    suffixIcon: ref.watch(feedMeRegisterPassProvider) ? LineIcons.eye :
                                    LineIcons.eyeSlash,
                                    suffixOnTap: ref.watch(feedMeRegisterPassProvider.notifier).obscureTextToggle,
                                    obscureText: ref.watch(feedMeRegisterPassProvider),
                                    keyboardType: TextInputType.visiblePassword,
                                      onChanged: (String value) {}),

                                  const SizedBox(height:16,),


                                  ///Confirm password
                                  CustomTextFormField(
                                      hintText: LangEnum.confirmPassword.tr(),
                                      prefixIcon: LineIcons.lock,
                                      validator: Validation.password,
                                      suffixIcon: ref.watch(feedMeRegisterConfirmPassProvider) ? LineIcons.eye :
                                      LineIcons.eyeSlash,
                                      suffixOnTap: ref.watch(feedMeRegisterConfirmPassProvider.notifier).obscureTextToggle,
                                      obscureText: ref.watch(feedMeRegisterConfirmPassProvider),
                                      keyboardType: TextInputType.visiblePassword,
                                      onChanged: (String value) {}),

                                  const SizedBox(height:16,),



                                ],
                              ),
                            ),
                          ),
                        );
                      },)
                  ),


                  ElevatedButton(
                    onPressed: ()async {
                      if (formKey.currentState!.validate()) {
                        closeKeyBoard();
                        Get.toNamed(VerifyRouting.config().path);
                      }

                    },
                    child: Text(LangEnum.continueWord.tr()),
                  ),

                  const SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}