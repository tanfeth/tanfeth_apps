


import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/confirm_order/vm/order_type_vm.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/confirm_order/widget/select_address_widget.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/confirm_order/widget/select_branch_widget.dart';

class OrderTypeWidget extends ConsumerStatefulWidget{
  const OrderTypeWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_OrderTypeWidget();


}

class _OrderTypeWidget extends ConsumerState<OrderTypeWidget>{


  late FeedMeOrderTypeVM feedMeOrderTypeVM;
  late int selectedType;

  initBuild(){
    feedMeOrderTypeVM = ref.watch(feedMeOrderTypeProvider.notifier);
    selectedType = ref.watch(feedMeOrderTypeProvider);
  }


  @override
  Widget build(BuildContext context) {
    initBuild();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          LangEnum.orderType.tr(),
          style: context.text.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            // color:context.color.primary
          ),
        ),
        10.ph,


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                splashColor: context.color.surface,
                onTap: (){
                  feedMeOrderTypeVM.changeIndex(currentIndex: 0);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color:selectedType == 0?
                    context.color.primary
                        :context.color.surface,
                    border: Border.all(width: 1,
                    color: context.color.onSurface)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.takeAway,
                        height: 20,
                        width: 20,
                      ),
                      15.pw,
                      Text(
                        LangEnum.fromRestaurant.tr(),
                        style: TextStyle(
                          color:selectedType == 0?
                          context.color.onPrimary
                              :context.color.onSurface,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            15.pw,
            Expanded(
              child: InkWell(
                splashColor: context.color.surface,
                onTap: (){
                  feedMeOrderTypeVM.changeIndex(currentIndex: 1);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color:selectedType == 1?
                      context.color.primary
                          :context.color.surface,
                      border: Border.all(width: 1,
                          color: context.color.onSurface)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.deliveryBike,
                        height: 20,
                        width: 20,
                      ),
                      15.pw,
                      Text(
                        LangEnum.homeDelivery.tr(),
                        style: TextStyle(
                          color:selectedType == 1?
                          context.color.onPrimary
                              :context.color.onSurface,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),


        Column(
          children: [
            10.ph,
            if(selectedType == 0)...[
              const  SelectBranchWidget(),
            ]else ...[
              const SelectAddressWidget(),
            ]
          ],
        ),



      ],
    );
  }

}