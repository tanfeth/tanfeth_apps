import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/complete_trip_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/vm/destination_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/helper_methods.dart';


class FooterPayWayWidget extends ConsumerStatefulWidget{
  const FooterPayWayWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _FooterPayWayWidget();


}

class _FooterPayWayWidget extends ConsumerState<FooterPayWayWidget>{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(ref.read(destinationListProvider).isEmpty){
          showFailed(msg: LangEnum.selectDestination.tr());
        }else{
          Get.toNamed(CompleteTripRouting.config().path);

          // showBottomSheetFunction(
          //   content:CompleteTripRouting.config().widget,
          // );
        }

      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Image.asset(
                    getPaymentImage(ref:ref),
                    width: 23,
                    height: 23,
                  ),
                  20.pw,

                  Expanded(
                    child: Text(
                      getPaymentName(ref:ref),
                      style: context.text.bodyLarge,
                    ),
                  ),

                ],
              ),
            ),

            GestureDetector(
              onTap: (){
                showBottomSheetFunction(
                  content:CompleteTripRouting.config().widget,
                );
              },
              child: Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: context.color.onSurface,
              ),
            ),

          ],
        ),
      ),
    );
  }



}