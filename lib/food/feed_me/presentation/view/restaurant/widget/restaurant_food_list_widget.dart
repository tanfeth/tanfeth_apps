




import 'package:api_controller/presentation/widget/shimmer_widget.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/EmptyResult.dart';
import 'package:tanfeth_apps/food/common/shared/routes/restaurant_profile_route.dart';
import 'package:tanfeth_apps/food/feed_me/data/model/layout/RestaurantModel.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/vm/resturant_list_vm.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/widget/restaurant_cell.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/restaurant/widget/food_menu_cell.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/restaurant/vm/restaurant_menu_vm.dart';

class RestaurantFoodListWidget extends ConsumerStatefulWidget{
  const RestaurantFoodListWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_RestaurantFoodListWidget();

}


class _RestaurantFoodListWidget extends ConsumerState<RestaurantFoodListWidget>{

  late bool isLoading ;
  List<RestaurantModel> restaurantList = [];

  @override
  void initState() {
    setLoading();
    super.initState();
  }


  initBuild(){

    isLoading  = ref.watch(restaurantMenuListProvider);
  }


  @override
  Widget build(BuildContext context) {
    initBuild();
    return  SliverList(
        delegate: SliverChildBuilderDelegate(
              (_, index) {
                if (isLoading
                // && index >= restaurantList.length
                ) {
                  return  Container(
                    height: 130,
                    margin: const EdgeInsets.all(10),
                    child: const ShimmerWidget(),
                  );
                } else if (!isLoading &&
                    restaurantList.isEmpty) {
                  return const Center(
                      child: EmptyResult());
                } else {
                  return InkWell(
                    splashColor: context.color.surface,
                    onTap: () {
                      Get.toNamed(RestaurantProfileRouting.config().path);
                    },
                    child: Column(
                      children: [
                       const  FoodMenuCell(),
                        10.ph,
                      ],
                    ),
                  );
                }

          },
          childCount:
          (isLoading
              ? 7
              : !isLoading &&
              restaurantList.isEmpty
              ? 1
              : 0) +
              restaurantList.length,
        ));
  }

   setLoading() async{
     WidgetsBinding.instance.addPostFrameCallback((_) async {
       ref.read(restaurantMenuListProvider.notifier)
           .changeLoading(loading: true);

       for(int i= 0 ; i < 10 ; i++){
         RestaurantModel  model = RestaurantModel();
         model.name = 'تورتيلا';
         model.closeTime = '3.30 ص';
         model.isFav = false;
         model.rate = 4.9;
         restaurantList.add(model);
       }

       Future.delayed(const Duration(seconds: 1),(){
         ref.read(restaurantMenuListProvider.notifier)
             .changeLoading(loading: false);
       });
     });

 
  }

}