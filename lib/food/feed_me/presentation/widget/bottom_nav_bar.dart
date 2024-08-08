


import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/vm/bottom_bar_vm.dart';



class BottomNavBar extends ConsumerStatefulWidget{
  final List<TabData> tabs ;
  const BottomNavBar({super.key,required this.tabs});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_BottomNavBar();


}

class _BottomNavBar extends ConsumerState<BottomNavBar>{


  late FeedMeBottomBarVM feedMeBottomBarVM;
  late int currentPage ;
  



  @override
  void initState() {
    super.initState();
  }

  
  initBuild(){
    feedMeBottomBarVM = ref.watch(feedMeBottomBarProvider.notifier);
    currentPage = ref.watch(feedMeBottomBarProvider);
  }


  @override
  Widget build(BuildContext context) {
    initBuild();
    return CubertoBottomBar(
      key: const Key("BottomBar"),
      inactiveIconColor: context.color.primary,
      tabStyle: CubertoTabStyle.styleNormal,
      selectedTab: currentPage,
      barBackgroundColor: context.color.surface,
      tabs: widget.tabs
          .map(
            (value) => TabData(
          key: Key(value.title),
          iconData: value.iconData,
          title: value.title,
          tabColor: value.tabColor,
          tabGradient: value.tabGradient,
        ),
      )
          .toList(),
      onTabChangedListener: (position, title, color) {
        feedMeBottomBarVM.changePageIndex(currentIndex: position);
      },
    );
  }

}
