
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
import 'package:tanfeth_apps/common/shared/picker_helper.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/terms_service_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/verify/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/form_validation.dart';


class DriverRegisterView extends ConsumerStatefulWidget{
  const DriverRegisterView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DriverRegisterView();

}

class _DriverRegisterView extends ConsumerState<DriverRegisterView>{

  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final birthDatHijriController = TextEditingController();
  final iDController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late bool isDisable=true;
  late bool isMale=true;
  Country selectedMobile = getCountry();


  @override
  void initState() {
   
    super.initState();
  }
  
  
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
            padding: EdgeInsets.symmetric(horizontal: 24),
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
                          SizedBox(height: 24,),

                          ///Full name
                          CustomTextFormField(
                              controller: userNameController,
                              keyboardType: TextInputType.text,
                              hintText: LangEnum.fullname.tr(),
                              textInputAction: TextInputAction.next,
                              validator: Validation.notEmpty,
                              onChanged: (String value) {}),

                          SizedBox(height:16,),


                          ///Saudi ID
                          CustomTextFormField(
                              controller: iDController,
                              keyboardType: TextInputType.number,
                              hintText: LangEnum.saudiID.tr(),
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              validator: Validation.notEmpty,
                              onChanged: (String value) {}),

                          SizedBox(height:16,),

                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: CustomTextFormField(
                                keyboardType: TextInputType.phone,
                                hintText: LangEnum.numPhone.tr(),
                                textInputAction: TextInputAction.next,
                                validator: customAppFlavor.defaultCountryCode == 'SA'?
                                Validation.phone:Validation.notEmpty,
                                maxLength: customAppFlavor.defaultCountryCode == 'SA'?
                                9:null,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                suffixWidget: CountryCodeWidget(
                                  onSelect: (Country country) {
                                    selectedMobile = country;
                                    setState(() {});
                                  },
                                  selectedPhoneCountry: selectedMobile,
                                ),
                                onChanged: (String value) {
                                  if(value.length == 9){
                                    closeKeyBoard();
                                  }
                                }),
                          ),

                          SizedBox(height:16,),
                          ///Email
                          CustomTextFormField(
                              controller: userEmailController,
                              keyboardType: TextInputType.text,
                              hintText: LangEnum.email.tr(),
                              textInputAction: TextInputAction.next,
                              validator: Validation.notEmpty,
                              onChanged: (String value) {}),

                          SizedBox(height:16,),

                          ///BirthdateHijri
                          CustomTextFormField(
                              controller: birthDatHijriController,
                              keyboardType: TextInputType.text,
                              hintText: LangEnum.birthdateHijri.tr(),
                              readOnly: true,
                              onTap: ()async{
                                await AppPicker.selectHijriDate(context,birthDatHijriController);
                              },
                              textInputAction: TextInputAction.next,
                              validator: Validation.notEmpty,
                              onChanged: (String value) {}),


                          SizedBox(height:16,),

                          ///Gender
                          Text(
                            LangEnum.gender.tr(),
                            style: context.text.titleMedium,
                            textAlign: TextAlign.start,
                          ),

                          SizedBox(height:16,),

                          Row(
                            children: [
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap:(){

                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 48,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color:isMale? context.color.primary:null,
                                      borderRadius: BorderRadius.circular(8),
                                      border: isMale? null:Border.all(
                                          color: context.color.surfaceContainerHighest)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                    child:Text(
                                      LangEnum.male.tr(),
                                    )
                                  ),
                                ),
                              ),
                              SizedBox(width: 8,),
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap:(){

                                },
                                child: Container(
                                  height: 48,
                                  width:100,
                                  decoration: BoxDecoration(
                                      color:isMale? null:context.color.primary,
                                      borderRadius: BorderRadius.circular(8),
                                      border:isMale? Border.all(color: context.color.surfaceContainerHighest):null
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16),
                                      child: Text(
                                        LangEnum.female.tr(),
                                      )
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),


                  ElevatedButton(
                    onPressed: ()async {
                      if (formKey.currentState!.validate()) {
                        closeKeyBoard();
                        Get.toNamed(TermsOfServiceRouting.config().path);
                      }
                    },
                    child: Text(LangEnum.continueWord.tr()),
                  ),

                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}