
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:api_controller/vm/langauge/langauge_vm.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/trips_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/TripModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/TripsModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/analytics/widget/time_cell.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/trips/widget/info_item_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/trips/widget/trip_cell.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/helper_methods.dart';

class TripsView extends ConsumerStatefulWidget{
  const TripsView();
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TripsView();

}

class _TripsView extends ConsumerState<TripsView>{

  TripsModel tripsModel = TripsModel();
  TripModel tripModel = TripModel();

   int selectedIndex = 1;
  String date=DateFormat('yyyy-MM-dd').format(DateTime.now().toLocal());
  List<String> timers = [];
  
  @override
  void initState() {
    tripsModel.totalTrips = 10;
    tripsModel.completedTrips = 5;
    tripsModel.rejectedTrips = 3;
    tripsModel.cancelledTripFromUser = 1;
    tripsModel.passengerDidNotShow  =1;

    /// TripModel
    tripModel.orderId =1 ;
    tripModel.destinationName = 'Damamm';
    tripModel.totalPrice = 100;
    tripModel.tripStatus = 'Done';
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    tripModel.creationDate = dateFormat.format(DateTime.now());
    tripsModel.lastTrips?.add(tripModel);
    timers.addAll(
        [LangEnum.daily.tr(), LangEnum.weekly.tr(), LangEnum.monthly.tr()]);
     selectedIndex = int.parse(Get.parameters[TripsRouting.index] ?? '1');

    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.myTrips.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16,),
              Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: (){

                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                              color: context.color.surfaceContainerHighest,
                              width: 2)),
                      child:  SvgPicture.asset(
                        ref.watch(languageProvider) == 'en'?
                        Images.arrowSVG:
                        Images.arrowLeftSVG,
                        colorFilter: ColorFilter.mode(
                            context.color.onSurface,
                            BlendMode.srcIn),
                      ),
                      )
                    ),

                  15.pw,
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        showBottomSheetFunction(
                            content: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  10.ph,
                                  const Center(
                                      child: CloseBottomSheetWidget()),
                                  10.ph,

                                  Text(
                                    LangEnum.timeRange.tr(),
                                    style: context.text.titleMedium,
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  ListView.builder(
                                    itemCount: 3,
                                    shrinkWrap: true,
                                    physics:
                                    const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return TimeCell(
                                        time: timers[index],
                                        index: index,
                                        context: context,
                                      );
                                    },
                                  ),
                                  // ...List.generate(3, (index) => AnalyticsTimeCell(time: timers[index], index: index,))
                                ],
                              ),
                            ));

                      },
                      child: Row(
                        children: [
                          Text(
                            formatMonthDay(DateTime.parse(date),selectedIndex:selectedIndex),
                            style: context.text.titleMedium,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          
                          SvgPicture.asset(
                            Images.downArrow,
                            width: 24,
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
              
                  
                  ( selectedIndex==0 && DateTime.now().toLocal().day > DateTime.parse(date).toLocal().day )||
                      ( selectedIndex==1 &&DateTime.now().toLocal().month > DateTime.parse(date).toLocal().month)||
                      ( selectedIndex==2 &&DateTime.now().toLocal().weekday > DateTime.parse(date).toLocal().weekday)?
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: (){
                      
                      },
                    child: Container(
                      alignment: Alignment.center,
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                              color: context.color.surfaceContainerHighest,
                              width: 2)),
                      child:   SvgPicture.asset(
                        ref.watch(languageProvider) == 'en'?
                        Images.arrowSVG:
                        Images.arrowLeftSVG,
                        colorFilter: ColorFilter.mode(
                            context.color.onSurface,
                            BlendMode.srcIn),
                      ),
                    ),
                  ):Container(
                    alignment: Alignment.center,
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: context.color.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color:
                        context.color.surfaceContainerHighest, width: 2)),
                    child:   SvgPicture.asset(
                      ref.watch(languageProvider) == 'en'?
                      Images.arrowSVG:
                      Images.arrowLeftSVG,
                      colorFilter: ColorFilter.mode(
                          context.color.onSurface,
                          BlendMode.srcIn),
                    ),
                  ),
                ],
              ),

              InfoItemWidget(title: LangEnum.finishedTrips.tr(), value: "${tripsModel.completedTrips}""/""${tripsModel.totalTrips}"),
              InfoItemWidget(title: LangEnum.youDidntAccept.tr(), value: "${tripsModel.rejectedTrips}"),
              InfoItemWidget(title:LangEnum.youCanceled.tr(), value: "${tripsModel.cancelledTripFromUser}"),
              InfoItemWidget(title: LangEnum.passengerCanceled.tr(), value: "${tripsModel.cancelledTripFromUser}"),
              InfoItemWidget(title: LangEnum.passengerDidntShow.tr(), value: "${tripsModel.passengerDidNotShow}"),

              SizedBox(height: 38,),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: tripsModel.lastTrips?.length,
              //     physics: const BouncingScrollPhysics(),
              //     itemBuilder: (context, index) => TripCell(
              //       title:tripsModel.lastTrips?[index].destinationName??'',
              //       status: tripsModel.lastTrips?[index].tripStatus??'',
              //       time: "${DateFormat.MMMd().format(DateTime.parse((tripsModel.lastTrips??[])[index].creationDate??''))} - ${DateFormat.jm().format(DateTime.parse(tripsModel.lastTrips?[index].creationDate??''))}",
              //       function: () {
              //
              //       },
              //       cost: tripsModel.lastTrips?[index].totalPrice??0.0,
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