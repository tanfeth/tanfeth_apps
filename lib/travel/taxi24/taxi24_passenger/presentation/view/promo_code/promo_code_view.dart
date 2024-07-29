

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:lottie/lottie.dart';
import 'package:tanfeth_apps/common/shared/lottie.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/form_validation.dart';

class PromoCodeView extends ConsumerStatefulWidget{

  const PromoCodeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _PromoCodeView();


}

class _PromoCodeView extends ConsumerState<PromoCodeView>{

  final formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.addPromo.tr(),
        leadingWidget:  BackButtonWidget(
          onTap: (){
            Get.back(
                result: controller.text
            );
          },
        ),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:
            24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        20.ph,
                        Form(
                          key: formKey,
                          child: CustomTextFormField(
                              controller: controller,
                              keyboardType: TextInputType.text,
                              hintText: LangEnum.promoCode.tr(),
                              textInputAction: TextInputAction.next,
                              validator: Validation.notEmpty,),
                        ),


                        Lottie.asset(LottieFiles.promoCode),


                      ],
                    ),
                  ),
                ),


                ElevatedButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      closeKeyBoard();
                      Get.back(
                          result: controller.text
                      );
                    }

                  },
                  child: Text(LangEnum.activate.tr()),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

}