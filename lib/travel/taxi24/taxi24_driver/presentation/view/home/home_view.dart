import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/storage.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/custom_slide_panel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/home/widget/home_header.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/map_widget.dart';
import 'package:showcaseview/showcaseview.dart';


class TaxiDriverHomeView extends ConsumerStatefulWidget {
  const TaxiDriverHomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<TaxiDriverHomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<TaxiDriverHomeView> {

  DateTime backPressDateTime = DateTime.now();

  GlobalKey one = GlobalKey();
  GlobalKey two = GlobalKey();
  GlobalKey three = GlobalKey();

  @override
  void initState() {
    if(AppStorage.getHomeCase() == true){
      showCaseEvent(context: context,caseList: [one,two,three]);
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
        body: WebWidth(
            child: Stack(children: [
          MapWidget(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: HomeHeader(
                  one: one,
                  two: two,
                )),
              ],
            ),
          ),

              CustomSlidePanel(
                minHeight: 90,
                maxHeight: 90,
                hasBorderRadius: false,
                locationDetectorEnabled: true,
                onTapCurrentLocation: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Showcase(
                    key: three,
                    description: LangEnum.startOption.tr(),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(LangEnum.start.tr()),
                    ),
                  ),
                ),
              ),


        ])),
      ),
    );
  }


}
