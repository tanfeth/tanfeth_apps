import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/profile_routing.dart';
import 'package:tanfeth_apps/common/shared/storage.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/vm/map_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/home/current_location/current_location_fab.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/home/widget/home_header.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/home/widget/searching_trip_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/home/widget/coming_trip_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/find_driver/vm/searching_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/vm/toggle_animation_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/widget/map_widget.dart';
import 'package:showcaseview/showcaseview.dart';

class TaxiDriverHomeView extends ConsumerStatefulWidget {
  const TaxiDriverHomeView({super.key});

  @override
  ConsumerState<TaxiDriverHomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<TaxiDriverHomeView> {
  DateTime backPressDateTime = DateTime.now();

  GlobalKey one = GlobalKey();
  GlobalKey two = GlobalKey();
  GlobalKey three = GlobalKey();
  GlobalKey four = GlobalKey();

  @override
  void initState() {
    if (AppStorage.getHomeCase() == true) {
      showCaseEvent(context: context, caseList: [one, two, four, three]);
    }

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
          showToast(LangEnum.pressAgainToExit.tr(),
              position: ToastPosition.bottom);
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        drawer: Drawer(
          child: ProfileRouting.config().widget,
        ),
        body: WebWidth(
            child: Stack(children: [
          const MapWidget(),

          ///Current location
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FadeInUp(
                animate: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: Showcase(
                    key: four,
                    description: LangEnum.currentLocationHint.tr(),
                    child: CurrentLocationDetector(onTap: () async {
                      ref
                          .read(mapProvider.notifier)
                          .getCurrentLocation(setMakers: true);
                    }),
                  ),
                ),
              ),
            ),
          ),

          ///Header
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: HomeHeader(
                one: one,
                two: two,
              )),



          /// Searching trip
          Positioned.fill(
            child: IgnorePointer(
              ignoring:
                  !(ref.watch(toggleAnimationProvider).tripFooter ?? false),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FadeInUp(
                  animate:
                      ref.watch(toggleAnimationProvider).tripFooter ?? false,
                  child:  ref.watch(searchingProvider) == 1?
                      const ComingTripWidget()
                      :const SearchingTripWidget(),
                ),
              ),
            ),
          ),



          ///Start button
          Align(
            alignment: Alignment.bottomCenter,
            child: FadeInUp(
              animate:
                  ref.watch(toggleAnimationProvider).confirmFooter ?? false,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Showcase(
                  key: three,
                  description: LangEnum.startOption.tr(),
                  onBarrierClick: () {
                    AppStorage.showHomeCase(false);
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      ref
                          .read(toggleAnimationProvider.notifier)
                          .toggleConfirmFooterAnimate(false);
                      ref
                          .read(toggleAnimationProvider.notifier)
                          .toggleTripFooterAnimate(true);

                      Future.delayed(const Duration(seconds: 4),(){
                        ref.read(searchingProvider.notifier).changeCurrentIndex(1);
                      });



                    },
                    child: Text(LangEnum.start.tr()),
                  ),
                ),
              ),
            ),
          ),
        ])),
      ),
    );
  }
}
