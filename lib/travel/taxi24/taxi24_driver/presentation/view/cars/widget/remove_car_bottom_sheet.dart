


import 'package:flutter/material.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/CarModel.dart';

class RemoveCarBottomSheet extends StatelessWidget {
  final CarModel carModel;
  const RemoveCarBottomSheet({super.key,required this.carModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            10.ph,
            const Center(child: CloseBottomSheetWidget()),
            15.ph,

            Center(
              child: Text(
                "${LangEnum.sureRemove.tr()}${' '}${carModel.carType!}${' '}"
                  "${carModel.carModel!}${' '}"
                  "${carModel.plateNo!}",
                 style: context.text.titleMedium,
              ),
            ),


            SizedBox(
              height: 16,
            ),

            Text(
              LangEnum.willNotAbleCar.tr()
            ),

            SizedBox(
              height: 32,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ElevatedButton(
                onPressed: () async {
                },
                child: Text(LangEnum.removeCar.tr()),
              ),
            ),

            10.ph,
            Center(
              child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    LangEnum.cancel.tr(),
                    style: context.text.titleLarge,
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
