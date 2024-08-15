
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/restaurant/vm/restaurant_menu_vm.dart';

class RestaurantCategoryWidget extends ConsumerStatefulWidget{
  const RestaurantCategoryWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_RestaurantCategoryWidget();



}

class _RestaurantCategoryWidget extends ConsumerState<RestaurantCategoryWidget>{


  List<String> categoryImage = [
    Images.pizza,
    Images.shawarma,
    Images.drinks,
    Images.burger,
    Images.sutis
  ];

  List<String> categoryName = [
    LangEnum.pizza.tr(),
    LangEnum.shawarma.tr(),
    LangEnum.drinks.tr(),
    LangEnum.burger.tr(),
    LangEnum.sweets.tr(),
  ];



  int selectedIndex = -1;



  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: categoryImage.length,
        itemBuilder: (context,index){
          return InkWell(
            splashColor: context.color.surface,
            onTap: (){
              ref.read(restaurantMenuListProvider.notifier)
                  .changeLoading(loading: true);

              Future.delayed(const Duration(seconds: 1),(){
                ref.read(restaurantMenuListProvider.notifier)
                    .changeLoading(loading: false);
              });

              if( selectedIndex == index){
                selectedIndex = -1;
              }else {
                selectedIndex = index;
              }

              setState(() {});
            },
            child: Column(
              children: [

                Card(
                  color: selectedIndex == index?
                  context.color.primary:
                  context.color.surface,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      categoryImage[index],
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),

                8.ph,
                Text(
                    categoryName[index]
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => 15.pw,

      ),

    );
  }

}