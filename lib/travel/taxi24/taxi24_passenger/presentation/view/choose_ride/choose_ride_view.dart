import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/widget/choose_ride_map_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/widget/choose_ride_slide_widget.dart';


class ChooseRideView extends ConsumerStatefulWidget{
  const ChooseRideView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChooseRideView();
  

}

class _ChooseRideView extends ConsumerState<ChooseRideView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.chooseRide.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Stack(
            children: [
              ChooseRideMapWidget(),

              ChooseRideSlideWidget(),
            ],
          )
        ),
      ),
    );
  }
  
}