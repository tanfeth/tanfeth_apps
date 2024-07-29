import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:api_controller/shared/helper_methods.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tanfeth_apps/common/presentation/widget/country_code/country_code_widget.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/shared/form_validation.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';


class AddRiderForm extends ConsumerStatefulWidget{
  final GlobalKey<FormState> formKey;
   const AddRiderForm({super.key,required this.formKey});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _AddRiderForm();


}

class _AddRiderForm extends ConsumerState<AddRiderForm>{


  late bool isDisable = true;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final FlutterContactPicker contactPicker =  FlutterContactPicker();
  Country selectedMobile = getCountry();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          ///Full name
          CustomTextFormField(
              controller: nameController,
              keyboardType: TextInputType.text,
              hintText: LangEnum.fullname.tr(),
              textInputAction: TextInputAction.next,
              validator: Validation.notEmpty,
              onChanged: (String value) {}),


          SizedBox(
            height: 8,
          ),

          Text(
            LangEnum.nameAppearToDriver.tr(),
            textAlign: TextAlign.start,
            style: TextStyle(
              color: context.color.surfaceContainerHighest
            ),
          ),

          SizedBox(
            height: 20,
          ),

          CustomTextFormField(
              keyboardType: TextInputType.phone,
              hintText: LangEnum.numPhone.tr(),
              controller: phoneController,
              textInputAction: TextInputAction.next,
              validator: customAppFlavor.defaultCountryCode == 'SA'?
              Validation.phone:Validation.notEmpty,
              prefixIcon: Icons.phone,
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


          SizedBox(height: 18,),
          GestureDetector(
            onTap: () async {
              bool? permissionStatus = await checkContactsPermission();
              if ((permissionStatus??false)) {
                Contact? contact = await contactPicker.selectContact();                String pattern=r'^((\+?966)|0)?5\d{8}$';
                RegExp regExp = RegExp(pattern);
                if(regExp.hasMatch(contact?.phoneNumbers?.first??'')){
                  phoneController.text=(contact?.phoneNumbers?.first??'').substring(
                      (contact?.phoneNumbers?.first??'').indexOf("5"));
                }
                else{
                  showFailed(msg:LangEnum.selectAvalidMobileNumber.tr());
                }
                nameController.text=contact?.fullName??'';
              }
              else {
                openAppSettings();
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                    Images.addressBookSVG,
                    height: 24,
                    width: 24
                ),

                SizedBox(
                  width: 8,
                ),

                Text(
                  LangEnum.getNumberContacts.tr(),
                  textAlign: TextAlign.center,
                  style: context.text.bodyLarge?.copyWith(
                    color: context.color.primary,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1,
                    decorationColor: context.color.primary
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}