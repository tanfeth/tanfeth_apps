import 'dart:ui';

import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/restaurant/widget/resaurant_profile_header.dart';
import 'package:badges/badges.dart' as badges;
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';


class RestaurantProfileView extends ConsumerStatefulWidget {
  const RestaurantProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RestaurantProfile();
}

class _RestaurantProfile extends ConsumerState<RestaurantProfileView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: context.color.primary, // Set the status bar color here
    ));

    return Scaffold(
      body: WebWidth(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(slivers: [
                  ///Header
                  SliverAppBar(
                      leadingWidth: 60,
                      leading:  const BackButtonWidget(),
                      actions: [
                        BackButtonWidget(
                          iconColor: context.color.onSurface,
                          icon:  Icons.favorite_border,
                          bgColor: context.color.surface,
                          onTap: (){

                          },
                        ),

                        BackButtonWidget(
                          iconColor: context.color.onSurface,
                          icon:  Icons.share,
                          bgColor: context.color.surface,
                          onTap: (){

                          },
                        ),

                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: BackButtonWidget(
                            iconColor: context.color.onSurface,
                            icon:  Icons.shopping_cart_outlined,
                            bgColor: context.color.surface,
                            onTap: (){

                            },
                          ),
                        ),
                        10.pw,
                      ],
                      flexibleSpace:const RestaurantProfileHeader(),
                      expandedHeight: 200,
                      toolbarHeight: 80,
                      pinned: true,
                      stretch: true,),


                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context,index){
                          return ListTile(
                            title: Text('Item $index'),
                          );
                        },
                      childCount: 20
                    ),
                  ),

                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
