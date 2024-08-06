

import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/food/feed_me/data/model/layout/CategoryModel.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/vm/resturant_list_vm.dart';

class CategoryWidget extends ConsumerStatefulWidget{
  const CategoryWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_CategoryWidget();


}

class _CategoryWidget extends ConsumerState<CategoryWidget>{


  List<CategoryModel> categoryList = [];
 List<String> categoryImage = [
   Images.bety,
   Images.pizza,
   Images.shawarma,
   Images.cheese,
   Images.italy,
   Images.drinks,
   Images.burger,
   Images.sutis
 ];

  List<String> categoryName = [
    LangEnum.bety.tr(),
    LangEnum.pizza.tr(),
    LangEnum.shawarma.tr(),
    LangEnum.cheese.tr(),
    LangEnum.italy.tr(),
    LangEnum.drinks.tr(),
    LangEnum.burger.tr(),
    LangEnum.sweets.tr(),
  ];


  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
           itemCount: categoryImage.length,
          itemBuilder: (context,index){
             return InkWell(
               splashColor: context.color.surface,
               onTap: (){
                 ref.read(restaurantListProvider.notifier)
                     .changeLoading(loading: true);

                 Future.delayed(const Duration(seconds: 1),(){
                   ref.read(restaurantListProvider.notifier)
                       .changeLoading(loading: false);
                 });

               },
               child: Column(
                 children: [

                   Card(
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