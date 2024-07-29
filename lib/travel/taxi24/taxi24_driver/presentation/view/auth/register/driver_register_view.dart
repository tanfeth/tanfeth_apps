
import 'package:country_picker/country_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/presentation/widget/country_code/country_code_widget.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:api_controller/shared/picker_helper.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/auth_routing/verify_route.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/gender_widget.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/select_city_widget.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/form_validation.dart';
import 'package:tanfeth_apps/travel/common/vm/city/city_list_vm.dart';
import 'package:tanfeth_apps/travel/common/vm/city/selected_city_vm.dart';
import 'package:tanfeth_apps/travel/common/vm/gender/gender_list_vm.dart';
import 'package:tanfeth_apps/travel/common/vm/gender/selected_gender_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/register/vm/register_vm.dart';


class DriverRegisterView extends ConsumerStatefulWidget{
  const DriverRegisterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DriverRegisterView();

}

class _DriverRegisterView extends ConsumerState<DriverRegisterView>{

  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final phoneController = TextEditingController();
  final birthDatHijriController = TextEditingController();
  final iDController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Country selectedCountry = getCountry();
  String deviceToken = '';

  late TaxiDriverRegisterVM taxiDriverRegisterVM;


  @override
  void initState() {
    taxiDriverRegisterVM  =ref.read(taxiDriverRegisterProvider.notifier);
     setDeviceToken();
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
                                  Text(
                                    LangEnum.enterDetails.tr(),
                                    style: context.text.titleMedium,
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(height: 24,),
                              
                                  ///Full name
                                  CustomTextFormField(
                                      controller: userNameController,
                                      keyboardType: TextInputType.text,
                                      hintText: LangEnum.fullname.tr(),
                                      textInputAction: TextInputAction.next,
                                      validator: Validation.notEmpty,
                                      onChanged: (String value) {}),
                              
                                  const SizedBox(height:16,),
                              
                              
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
                                          if(value.length == 9){
                                            closeKeyBoard();
                                          }
                                        }),
                                  ),
                              
                                  const SizedBox(height:16,),
                              
                                  ///City
                                  InkWell(
                                    onTap: (){
                                      showBottomSheetFunction(
                                        content:  const SelectCityWidget(),
                                      );
                                    },
                                    child: CustomTextFormField(
                                        keyboardType: TextInputType.text,
                                        hintText: LangEnum.city.tr(),
                                        textInputAction: TextInputAction.next,
                                        validator: Validation.notEmpty,
                                        enabled: false,
                                        suffixWidget: Icon(
                                          Icons.arrow_forward,
                                          color: context.color.onSurface,
                                          size: 20,
                                        ),),
                                  ),
                              
                              
                                  const SizedBox(height:16,),
                              
                                  ///Email
                                  CustomTextFormField(
                                      controller: userEmailController,
                                      keyboardType: TextInputType.text,
                                      hintText: LangEnum.email.tr(),
                                      textInputAction: TextInputAction.next,
                                      validator: Validation.email,
                                      onChanged: (String value) {}),
                              
                                  const SizedBox(height:16,),
                              
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
                                      validator: Validation.notEmpty),
                              
                              
                                  const SizedBox(height:16,),
                              
                                  ///Gender
                              
                                  Text(
                                    LangEnum.gender.tr(),
                                    style: context.text.titleMedium,
                                    textAlign: TextAlign.start,
                                  ),
                              
                                  const SizedBox(height:16,),
                              
                                  const  GenderWidget(),
                              
                              
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
                        showLoading();
                        setDataModel();

                        taxiDriverRegisterVM.userRegisterApi();
                        try{
                           await ref.read(
                              taxiDriverRegisterVM
                                  .futureProvider);
                          hideLoading();
                          Get.toNamed(VerifyRouting.config().path,
                              parameters: {
                                VerifyRouting.phone:
                                '${selectedCountry.phoneCode}${phoneController.text}',
                                VerifyRouting.pageType:
                                    customAppFlavor.commonEnum.verifyTypeByEnum.register
                              });
                        }catch(e){
                          hideLoading();
                          showFailed(msg:e.toString());
                        }

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




  void setDataModel() {
    taxiDriverRegisterVM.bodyRegisterModel.name =
         userNameController.text;
    taxiDriverRegisterVM.bodyRegisterModel.identityNumber =
        iDController.text;
    taxiDriverRegisterVM.bodyRegisterModel.phoneNumber=
        '${selectedCountry.phoneCode}${phoneController.text}';

    taxiDriverRegisterVM.bodyRegisterModel.city=
        ref.read(cityListProvider)[ref.read(selectedCityProvider)].id??0;

    taxiDriverRegisterVM.bodyRegisterModel.email=
        userEmailController.text;
    taxiDriverRegisterVM.bodyRegisterModel.dateOfBirth =
        formatDateTime(dateTime: birthDatHijriController.text);

    taxiDriverRegisterVM.bodyRegisterModel.gender=
        ref.read(genderListProvider)[ref.read(selectedGenderProvider)].id??0;

    taxiDriverRegisterVM.bodyRegisterModel.deviceToken=deviceToken;

  }



  void setDeviceToken()async {
   deviceToken =  await FirebaseMessaging.instance.getToken()??'';
  }

}