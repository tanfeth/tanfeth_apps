

import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/offers_route.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/home/home_view.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/vm/bottom_bar_vm.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/widget/appbar_notification_button.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/widget/bottom_nav_bar.dart';

class FeedMeLayoutView extends ConsumerStatefulWidget{
  const FeedMeLayoutView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_LayoutView();


}

class _LayoutView extends ConsumerState<FeedMeLayoutView>{

  DateTime backPressDateTime = DateTime.now();

  
  List<Widget> screens = [
    const HomeView(),
    OffersRouting.config().widget,
    const HomeView(),
    const HomeView(),
  ];
  
  
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
            child:screens[ref.watch(feedMeBottomBarProvider)]
          ),
        ),
      ),
    );
  }


}