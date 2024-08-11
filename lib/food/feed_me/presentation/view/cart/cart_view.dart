



import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/button_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/confirm_order_route.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/cart/widget/cart_cell.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/vm/bottom_bar_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/widget/small_divider.dart';

class CartView extends ConsumerStatefulWidget{
  const CartView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_CartView();

}

class _CartView extends ConsumerState<CartView>{
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
            child:  ListView.separated(
                itemBuilder: (context,index){
                  return const CartCell();
                },
                separatorBuilder: (context, index) => 10.ph,
                itemCount: 2),
          ),

          Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(LangEnum.total.tr(),
                      style: context.text.titleMedium,),
                    ),

                    const  Text("200 ريال")
                  ],
                ),
              ),
              20.ph,
             const  SmallDivider(),
              20.ph,


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: const ButtonStyle().GreyElevatedButton(context),
                      onPressed: () {
                        ref.watch(feedMeBottomBarProvider.notifier)
                            .changePageIndex(currentIndex: 0);
                      },
                      child: Row(
                        children: [
                          const Icon(
                              Icons.add_shopping_cart
                          ),
                          5.pw,
                          Text(
                            LangEnum.addMore.tr(),
                            textScaler: TextScaler.noScaling,
                          ),
                        ],
                      ),
                    ),
                  ),
                  15.pw,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(ConfirmOrderRouting.config().path);
                      },
                      child: Row(
                        children: [
                          const Icon(
                              Icons.check
                          ),
                          5.pw,
                          Expanded(child: Text(
                            LangEnum.confirmOrderAndPay.tr(),
                            maxLines: 1,)),
                        ],
                      ),
                    ),
                  ),
                ],
              ).hPadding(30),
            ],
          ),
        ],
      ),
    );
  }

}

