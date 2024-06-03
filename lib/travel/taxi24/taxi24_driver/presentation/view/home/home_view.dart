import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/custom_slide_panel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/home/widget/home_header.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/home/widget/map_widget.dart';

class TaxiDriverHomeView extends ConsumerStatefulWidget {
  const TaxiDriverHomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<TaxiDriverHomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<TaxiDriverHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebWidth(
          child: Stack(children: [
        MapWidget(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 70),
          child: Column(
            children: [
              HomeHeader(),

              //
              // if (!isLocationEnabledStatus)
              //   BlocBuilder<AlertLocationStatusViewModel, AlertLocationStates>(
              //       builder: (context, state) {
              //         return AlertLocationStatusWidget(
              //           bodyText: 'Please turn on location services.We need to know your location so we can find trips for you.'.tr(),
              //           isVisible: !isLocationEnabledStatus,
              //           function: () async {
              //
              //           },
              //         );
              //       }),
              // if (!locationPermission)
              //   BlocBuilder<AlertLocationStatusViewModel, AlertLocationStates>(
              //       builder: (context, state) {
              //         return AlertLocationStatusWidget(
              //           bodyText: 'Please Enable location , to use Taxi24'.tr(),
              //           isVisible: !locationPermission,
              //           function: () async => await alertViewModel.requestPermission(),
              //         );
              //       }),
            ],
          ),
        ),
        CustomSlidePanel(
          minHeight: 100,
          maxHeight: 100,
          hasBorderRadius: false,
          locationDetectorEnabled: true,
          onTapCurrentLocation: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(LangEnum.start.tr()),
            ),
          ),
        )
      ])),
    );
  }
}
