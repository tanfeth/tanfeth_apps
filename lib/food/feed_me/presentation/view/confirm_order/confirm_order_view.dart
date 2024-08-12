

import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/success_route.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/confirm_order/widget/order_time_widget.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/confirm_order/widget/order_type_widget.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/complete_trip/widget/coupon_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/complete_trip/widget/payment_methods_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/complete_trip/widget/payment_price_widget.dart';

class ConfirmOrderView extends ConsumerStatefulWidget{
  const ConfirmOrderView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_ConfirmOrderView();


}

class _ConfirmOrderView extends ConsumerState<ConfirmOrderView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.confirmOrderAndPay.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    // physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding:
                        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Column(
                          children: [
                            25.ph,

                            ///Order type
                            const OrderTypeWidget(),
                            25.ph,

                            ///Order time
                            const OrderTimeWidget(),
                            25.ph,
                            const PaymentMethodsWidget(
                              isVisa: false,
                              isWalletOption: true,
                            ),
                            25.ph,
                            const CouponWidget(),
                            const PaymentPriceWidget(),
                            25.ph,


                          ],
                        ),
                      )


                  ),
                ),




                ElevatedButton(
                  onPressed: () async {
                    Get.offNamed(SuccessRouting.config().path);
                  },
                  child: Text(LangEnum.confirm.tr()),
                ),

                25.ph,
              ],
            ),
          ),
        ),
      ),
    );
  }

}