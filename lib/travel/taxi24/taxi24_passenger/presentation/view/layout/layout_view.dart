

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:api_controller/shared/extensions/system_ui_overlay_extension.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/home_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/layout_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/wallet_route.dart';
import 'package:tanfeth_apps/travel/common/vm/map_vm.dart';

import 'package:tanfeth_apps/common/shared/routing/routes/profile_routing.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/layout/vm/layout_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/layout/widget/layout_nav_bar.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/layout/widget/taxi_passenger_float_widget.dart';


class TaxiPassengerLayoutView extends ConsumerStatefulWidget{
  const TaxiPassengerLayoutView({super.key});

  @override
  ConsumerState<TaxiPassengerLayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends ConsumerState<TaxiPassengerLayoutView>
    with SingleTickerProviderStateMixin{

  late String index;
  late LayoutVM layoutVM ;
  late MapVM mapVM;
  DateTime backPressDateTime = DateTime.now();
  final PageStorageBucket bucket = PageStorageBucket();


  final List<Widget> navScreens = <Widget>[
    WalletRouting.config().widget,
    HomeRouting.config().widget,
    ProfileRouting.config().widget,

  ];


  @override
  void initState() {
    index = Get.parameters[LayoutRouting.index] ?? '';
    mapVM = ref.read(mapProvider.notifier);
    layoutVM = ref.read(layoutProvider.notifier);
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        final timeGap = DateTime.now().difference(backPressDateTime);
        final cantExit = timeGap >= const Duration(seconds: 2);
        backPressDateTime = DateTime.now();
        if (cantExit) {
          showToast(LangEnum.pressAgainToExit.tr(), position: ToastPosition.bottom);
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        extendBody: true,
        floatingActionButton: TaxiPassengerFloatWidget(),
        body:IndexedStack(
          index: ref.watch(layoutProvider),
          children: navScreens,
        ),
        bottomNavigationBar:  TaxiPassengerLayoutBottomNavigationBar(
          layoutVM: layoutVM,
          onItemTap: (index){
            layoutVM.changeCurrentIndex(index);
          },
        ),
      ).systemUiDarkText(context),
    );

  }


}