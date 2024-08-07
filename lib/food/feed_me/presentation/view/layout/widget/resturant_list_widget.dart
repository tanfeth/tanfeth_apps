




import 'package:api_controller/presentation/widget/shimmer_widget.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/widget/EmptyResult.dart';
import 'package:tanfeth_apps/food/feed_me/data/model/layout/RestaurantModel.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/vm/resturant_list_vm.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/widget/restaurant_cell.dart';

class RestaurantListWidget extends ConsumerStatefulWidget{
  const RestaurantListWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_RestaurantListWidget();

}


class _RestaurantListWidget extends ConsumerState<RestaurantListWidget>{

  late bool isLoading ;
  List<RestaurantModel> restaurantList = [];

  @override
  void initState() {
    setLoading();
    super.initState();
  }


  initBuild(){

    isLoading  = ref.watch(restaurantListProvider);
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
                    onTap: () {
                    },
                    child: Column(
                      children: [
                        RestaurantCell(
                            model:restaurantList[index]
                        ),
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
              20,
        ));
  }

   setLoading() async{
     WidgetsBinding.instance.addPostFrameCallback((_) async {
       ref.read(restaurantListProvider.notifier)
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
         ref.read(restaurantListProvider.notifier)
             .changeLoading(loading: false);
       });
     });

 
  }

}