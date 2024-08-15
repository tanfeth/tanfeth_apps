

import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/restaurant/vm/profile_tabs_vm.dart';

class RestaurantTabsWidget extends ConsumerStatefulWidget{
  final TabController tabController;
  const RestaurantTabsWidget({super.key,
  required this.tabController});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_RestaurantTabsWidget();


}

class _RestaurantTabsWidget extends ConsumerState<RestaurantTabsWidget>
    with SingleTickerProviderStateMixin{

late FeedMeProfileTabsVM feedMeProfileTabsVM;


  @override
  void initState() {
    super.initState();
  }

  initBuild(){
    feedMeProfileTabsVM = ref.watch(feedMeProfileTabsProvider.notifier);
  }


  @override
  Widget build(BuildContext context) {
    initBuild();

    return   TabBar(
      controller: widget.tabController,
      unselectedLabelColor: context.color.onSurface,
      dividerHeight: 0.0,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      onTap: (index){
        feedMeProfileTabsVM.changeTabIndex(currentIndex: index);
      },
      tabs: [
        Tab(
          text: LangEnum.menu.tr(),),
        Tab(text: LangEnum.offers.tr()),
        Tab(text: LangEnum.images.tr()),
        Tab(text: LangEnum.branches.tr()),
      ],
    );
  }

}