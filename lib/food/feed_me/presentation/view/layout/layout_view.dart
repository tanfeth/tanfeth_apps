

import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/widget/appbar_notification_button.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/widget/category_widget.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/widget/filter_search_widget.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/widget/resturant_list_widget.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/widget/slide_show.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/widget/bottom_nav_bar.dart';

class FeedMeLayoutView extends ConsumerStatefulWidget{
  const FeedMeLayoutView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_LayoutView();


}

class _LayoutView extends ConsumerState<FeedMeLayoutView>{

  DateTime backPressDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        final timeGap = DateTime.now().difference(backPressDateTime);
        final cantExit = timeGap >= const Duration(seconds: 2);
        backPressDateTime = DateTime.now();
        if (cantExit) {
          showToast(LangEnum.pressAgainToExit.tr(),
              position: ToastPosition.bottom);
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        appBar: MainAppBar(
          appBarColor: context.color.primary,
          leadingWidget: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child:Image.asset(
              Images.appLogo
            ),
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          trailingWidget: const Row(
            children: [
              //AppbarSearch(),
              AppbarNotification(),
            ],
          ),
        ),
        bottomNavigationBar:const  BottomNavBar(),
        body: WebWidth(
          child: SafeArea(
            child: Column(
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
            ),
          ),
        ),
      ),
    );
  }

}