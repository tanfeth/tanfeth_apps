
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';

class AddRiderInstructionView extends ConsumerStatefulWidget{
  const AddRiderInstructionView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => 
      _AddRiderInstructionView();
  
}

class _AddRiderInstructionView extends ConsumerState<AddRiderInstructionView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child:Column(
              children: [
          Expanded(
            child: Column(
              children: [
                Center(
                  child: SvgPicture.asset(
                    Images.addRiderSVG,
                    width: 184,
                    height: 184,
                  ),),
                SizedBox(height: 32,),
                Text(
                  LangEnum.requestRideForSomeone.tr(),
                  style: context.text.titleMedium,
                ),
                SizedBox(height: 24,),

                RequestTripCondition(text: "Riders must be at least 18 years old or accompanied by an adult".tr()),
                RequestTripCondition(text: "They will receive the trip info in a text message".tr()),
                RequestTripCondition(text: "You will pay for the trip if it’s credit or they can pay the driver in cash".tr()),
                RequestTripCondition(text: "You can track the trip from your app".tr()),


              ],
            ),
          ),

                ElevatedButton(
                  onPressed: () async {
                    // Get.toNamed(AddRiderRoute.config().path);
                  },
                  child: Text(LangEnum.addRider.tr()),
                ),

                SizedBox(height: 8,),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}