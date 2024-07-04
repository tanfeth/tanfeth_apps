import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/complete_trip_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/complete_trip/vm/selected_payment_method_vm.dart';


class FooterPayWayWidget extends ConsumerStatefulWidget{
  const FooterPayWayWidget();

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _FooterPayWayWidget();


}

class _FooterPayWayWidget extends ConsumerState<FooterPayWayWidget>{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        showBottomSheetFunction(
        content:CompleteTripRouting.config().widget,
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Image.asset(
                    getPaymentImage(),
                    width: 23,
                    height: 23,
                  ),
                  20.pw,

                  Expanded(
                    child: Text(
                      getPaymentName(),
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

  String getPaymentName() {
    if(ref.watch(selectedPaymentMethodProvider) ==
        customAppFlavor.commonEnum.paymentMethodEnum.bankTransfer){
      return LangEnum.onlinePayment.tr();
    }else if(ref.watch(selectedPaymentMethodProvider) ==
        customAppFlavor.commonEnum.paymentMethodEnum.visa){
      return LangEnum.visa.tr();
    }else {
     return LangEnum.cash.tr();
    }
  }

  String getPaymentImage() {
    if(ref.watch(selectedPaymentMethodProvider) ==
        customAppFlavor.commonEnum.paymentMethodEnum.bankTransfer){
      return Images.bank;
    }else if(ref.watch(selectedPaymentMethodProvider) ==
        customAppFlavor.commonEnum.paymentMethodEnum.visa){
      return Images.visa;
    }else {
      return Images.cash;
    }
  }

}