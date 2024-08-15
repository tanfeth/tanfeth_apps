import 'dart:ui';

import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/helper_methods.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:api_controller/vm/langauge/langauge_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/layout_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/offers_route.dart';
import 'package:tanfeth_apps/food/common/shared/routes/clients_rate_route.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/branch/branch_list_view.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/vm/bottom_bar_vm.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/restaurant/vm/profile_tabs_vm.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/restaurant/widget/resaurant_profile_header.dart';
import 'package:badges/badges.dart' as badges;
import 'package:tanfeth_apps/food/feed_me/presentation/view/restaurant/widget/restaurant_images-widget.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/restaurant/widget/restaurant_menu_widget.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/restaurant/widget/restaurant_offer_widget.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/restaurant/widget/restaurant_tabs_widget.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';

class RestaurantProfileView extends ConsumerStatefulWidget {
  const RestaurantProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RestaurantProfile();
}

class _RestaurantProfile extends
ConsumerState<RestaurantProfileView> with SingleTickerProviderStateMixin{
  bool isFav = false;
  late TabController tabController;
  PageController pageController =
  PageController(viewportFraction: 1, keepPage: true);

  List<Widget> pages = [
    const RestaurantMenuWidget(),
    const RestaurantOfferWidget(),
    const RestaurantImagesWidget(),
   const BranchListView(),

  ];

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: context.color.primary,
    ));

    return Scaffold(
      body: WebWidth(
        child: SafeArea(
          child: Column(
            children: [


              SizedBox(
                height: 350,
                child: CustomScrollView(slivers: [
                  ///Header
                  SliverAppBar(
                    leadingWidth: 60,
                    leading: const BackButtonWidget(),
                    actions: [
                      BackButtonWidget(
                        iconColor: isFav
                            ? context.color.error
                            : context.color.onSurface,
                        icon: isFav ? Icons.favorite : Icons.favorite_border,
                        bgColor: context.color.surface,
                        onTap: () {
                          isFav = !isFav;
                          if (isFav) {
                            showSuccess(msg: LangEnum.toastAddFavMessage.tr());
                          } else {
                            showFailed(
                                msg: LangEnum.toastRemoveFavMessage.tr());
                          }

                          setState(() {});
                        },
                      ),
                      BackButtonWidget(
                        iconColor: context.color.onSurface,
                        icon: Icons.share,
                        bgColor: context.color.surface,
                        onTap: () {
                          shareLink(link: 'https://www.google.co.uk/');
                        },
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: BackButtonWidget(
                          iconColor: context.color.onSurface,
                          icon: Icons.shopping_cart_outlined,
                          bgColor: context.color.surface,
                          onTap: () {
                            ref
                                .watch(feedMeBottomBarProvider.notifier)
                                .changePageIndex(currentIndex: 2);
                            Get.back();

                            // Get.offNamed(LayoutRouting.config().path);
                          },
                        ),
                      ),
                      10.pw,
                    ],
                    flexibleSpace: const RestaurantProfileHeader(),
                    expandedHeight: 200,
                    toolbarHeight: 80,
                    pinned: true,
                    stretch: true,
                  ),

                  ///Rate
                  SliverAppBar(
                    leading: const SizedBox.shrink(),
                    flexibleSpace: InkWell(
                      splashColor: context.color.surface,
                      onTap: () {
                        Get.toNamed(ClientsRateRouting.config().path);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        color: context.color.primary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            5.pw,
                            Text(
                              LangEnum.clientRate.tr(),
                              style: context.text.titleMedium
                                  ?.copyWith(color: context.color.onPrimary),
                            ),
                            10.pw,
                            ...List.generate(
                                5,
                                (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      child: Icon(
                                        Icons.star,
                                        size: 20,
                                        color: context.color.secondary,
                                      ),
                                    )),
                            10.pw,
                            Text(
                              '4.8',
                              style: context.text.titleMedium
                                  ?.copyWith(color: context.color.onPrimary),
                            ),
                            15.pw,
                            Icon(
                              (ref.read(languageProvider) == 'ar'
                                  ? LineIcons.arrowLeft
                                  : LineIcons.arrowLeft),
                              color: context.color.onPrimary,
                            ),
                          ],
                        ),
                      ),
                    ),
                    expandedHeight: 80,
                    toolbarHeight: 80,
                    pinned: false,
                    stretch: true,
                  ),


                  ///Tabs
                   SliverAppBar(
                    leading: const SizedBox.shrink(),
                    flexibleSpace: RestaurantTabsWidget(
                        tabController:tabController
                    ),
                    pinned: true,
                    stretch: true,
                  ),


                  // SliverList(
                  //   delegate: SliverChildBuilderDelegate((context, index) {
                  //     return Column(
                  //       children: [
                  //         RestaurantTabsWidget(),
                  //       ],
                  //     );
                  //   },childCount: 20),
                  // ),

                ]),
              ),



              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount:  pages.length,
                  itemBuilder: (context,index){
                    return pages[ref.watch(feedMeProfileTabsProvider)];
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index){
                    ref.read(feedMeProfileTabsProvider.notifier)
                        .changeTabIndex(currentIndex: index);
                    pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeIn);
                    tabController.animateTo(index);
                  },
                )
              ),

              // Padding(
              //   padding: const EdgeInsets.all(15.0),
              //   child: ElevatedButton(
              //     onPressed: () async {
              //      // Get.toNamed(RestaurantProfileRouting.config().path);
              //     },
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         const Icon(
              //           Icons.shopping_cart_outlined,
              //           size: 20,
              //         ),
              //
              //         10.pw,
              //         Text(LangEnum.shoppingCart.tr()),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
