

import 'package:api_controller/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/vm/bottom_bar_vm.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/widget/filter_search_widget.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/restaurant/widget/restaurant_category_widget.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/restaurant/widget/restaurant_food_list_widget.dart';

class RestaurantMenuWidget extends ConsumerStatefulWidget{
  const RestaurantMenuWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_RestaurantMenuWidget();


}

class _RestaurantMenuWidget extends ConsumerState<RestaurantMenuWidget>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const Expanded(
          child: CustomScrollView(
            slivers:  [
              ///Search && filter
              SliverAppBar(
                flexibleSpace: FilterSearchWidget(),
                floating: true,
                expandedHeight: 70,
                stretch: true,
                toolbarHeight: 50,
                pinned: false,
                leading:  SizedBox.shrink(),
              ),


              ///Category
              SliverAppBar(
                flexibleSpace: RestaurantCategoryWidget(),
                floating: true,
                expandedHeight: 130,
                stretch: true,
                toolbarHeight: 110,
                pinned: false,
                leading:  SizedBox.shrink(),
              ),

              RestaurantFoodListWidget(),

            ],
          ),
        ),


        InkWell(
          splashColor: context.color.surface,
          onTap: (){
            ref
                .watch(feedMeBottomBarProvider.notifier)
                .changePageIndex(currentIndex: 2);
            Get.back();
          },
          child: Container(
            height: 50,
            color: context.color.secondary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Icon(
                  Icons.shopping_cart_outlined,
                  size: 22,
                  color: context.color.primary,
                ),

                10.pw,
                Text(
                  LangEnum.shoppingCart.tr(),
                  style: context.text.titleMedium?.copyWith(
                    color: context.color.primary,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

}