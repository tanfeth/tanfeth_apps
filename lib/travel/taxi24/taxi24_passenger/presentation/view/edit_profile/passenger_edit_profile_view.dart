
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/shared/form_validation.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/personal_info/widget/change_photo.dart';

import '../../../../../../common/presentation/widget/text_form_field_widget.dart';

  class PassengerEditProfileView extends ConsumerStatefulWidget{
  const PassengerEditProfileView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PassengerEditProfileView();
  
}

class _PassengerEditProfileView extends ConsumerState<PassengerEditProfileView>{

  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();



  @override
  void initState() {
    _nameController.text = 'kareem mohamed';
    _mobileController.text = '966554541822';
    _emailController.text = 'kareem@taxi.app';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.editProfile.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding:  24.toHorizontal,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 12.ph,
                 // passenger image
                 Center(
                  child: ClipOval(
                      child: SizedBox(
                          width: 74,
                          height: 74,
                          child: SvgPicture.asset(Images.personAvatarSVG, width: 74, height: 74,)
                          )),
                ).vPadding(16),
                 // change image
                 const ChangePhotoWidget(),
                 40.ph,
                // edit name
                CustomTextFormField(
                    controller: _nameController,
                    suffixWidget: Icon(Icons.edit,size: 20,color:context.color.surfaceContainerHighest,),
                    keyboardType: TextInputType.text,
                    hintText: LangEnum.fullname.tr(),
                    prefixIcon: Icons.abc,
                    textInputAction: TextInputAction.next,
                    validator: Validation.notEmpty,
                    onChanged: (String value) {}).vPadding(12),
                // edit phone
                CustomTextFormField(
                    controller: _mobileController,
                    keyboardType: TextInputType.text,
                    suffixWidget: Icon(Icons.edit,size: 20,color:context.color.surfaceContainerHighest,),

                  hintText: LangEnum.mobile.tr(),
                    prefixIcon: Icons.phone,
                    textInputAction: TextInputAction.next,
                    validator: Validation.notEmpty,
                    onChanged: (String value) {},

                ).vPadding(12),
                // edit email
                CustomTextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.text,
                   suffixWidget: Icon(Icons.edit,size: 20,color:context.color.surfaceContainerHighest,),
                  hintText: LangEnum.email.tr(),
                    prefixIcon: Icons.email,
                    textInputAction: TextInputAction.next,
                    validator: Validation.notEmpty,
                    onChanged: (String value) {},).vPadding(12),
                Spacer(),
                ElevatedButton(
                  onPressed: ()async {},
                  child: Text(LangEnum.edit.tr()),
                ),
                Center(
                  child: Text(
                    LangEnum.deleteAccount.tr(),
                    style: context.text.titleMedium?.copyWith(
                        color: context.color.error
                    ),
                  ),
                ).vPadding(20),
                //const DeleteAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}