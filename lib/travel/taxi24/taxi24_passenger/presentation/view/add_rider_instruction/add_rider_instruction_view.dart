
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
import 'package:tanfeth_apps/travel/common/shared/routes/add_rider_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/add_rider_instruction/widget/rider_instruction_cell.dart';

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
      appBar: const MainAppBar(
        leadingWidget: BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child:Column(
              children: [
          Expanded(
            child: Column(
              children: [
                Center(
                  child: SvgPicture.asset(
                    Images.addRiderSVG,
                    width: 200,
                    height: 200,
                  ),),
                const SizedBox(height: 32,),
                Text(
                  LangEnum.requestRideForSomeone.tr(),
                  style: context.text.titleMedium,
                ),
                const SizedBox(height: 24,),
                RiderInstructionCell(
                  title: LangEnum.ridersMustLeast18Years.tr(),
                ),

                RiderInstructionCell(
                  title: LangEnum.theyReceiveTripInfoTextMmessage.tr(),
                ),

                RiderInstructionCell(
                  title: LangEnum.payTripCreditOrPayDriverCash.tr(),
                ),

                RiderInstructionCell(
                  title: LangEnum.trackTripFromApp.tr(),
                ),


              ],
            ),
          ),

                ElevatedButton(
                  onPressed: () async {
                     Get.offNamed(AddRiderRouting.config().path);
                  },
                  child: Text(LangEnum.addRider.tr()),
                ),

                const SizedBox(height: 15,),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}