




import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/widget/category_widget.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/widget/filter_search_widget.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/widget/resturant_list_widget.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/widget/slide_show.dart';

class HomeView extends ConsumerStatefulWidget{
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_HomeView();


}

class _HomeView extends ConsumerState<HomeView>{
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [

        15.ph,
        const SlideShow(),
        15.ph,



        const Expanded(
          child: CustomScrollView(
            slivers: [

              ///Search && filter
              SliverAppBar(
                flexibleSpace: FilterSearchWidget(),
                floating: true,
                expandedHeight: 70,
                stretch: true,
                toolbarHeight: 50,

              ),

              ///Category
              SliverAppBar(
                flexibleSpace: CategoryWidget(),
                floating: true,
                expandedHeight: 130,
                stretch: true,
                pinned:true,
                toolbarHeight: 110,

              ),

              RestaurantListWidget(),


            ],
          ),
        ),
      ],
    );
  }

}