import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/presentation/widget/monthes_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/trip_details_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/wallet_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/widget/small_divider.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/my_trip/widget/empty_trip.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/my_trip/widget/trip_cell.dart';

import '../trip_details/trip_details.dart';


class PassengerMyTripView extends StatelessWidget {
  List trips =[
    {
      "id":1,
      "address":"City stars mall",
      "cost":"125 SAR",
      "orderStatus":"complete",
      "creationDate":"${DateTime.now()}"
    },
    {
      "id":2,
      "address":"City stars mall",
      "cost":"125 SAR",
      "orderStatus":"complete",
      "creationDate":"${DateTime.now()}"
    },
    {
      "id":3,
      "address":"City stars mall",
      "cost":"125 SAR",
      "orderStatus":"complete",
      "creationDate":"${DateTime.now()}"
    },
    {
      "id":4,
      "address":"City stars mall",
      "cost":"125 SAR",
      "orderStatus":"complete",
      "creationDate":"${DateTime.now()}"
    },

  ];
  PassengerMyTripView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.myTrips.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: Padding(
          padding:24.toHorizontal,
          child: trips.isEmpty ? EmptyTrip()  : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MonthsWidget(callBack: (DateTime ) {
                print(DateTime);
              },).vPadding(30),
              20.ph,
              Expanded(
                child: ListView.separated(
                    itemCount: trips.length,
                    itemBuilder: (context, index)  {
                      return MyTripsCell(
                        title: trips[index]['address'],
                        status:trips[index]["orderStatus"],
                        time: trips[index]['creationDate'],
                        function: () {
                          print(TripDetailsRouting.config().path);
                           Get.toNamed(TripDetailsRouting.config().path,parameters: {
                             TripDetailsRouting.tripId:"${trips[index]['id']}",
                             TripDetailsRouting.orderTime:trips[index]['creationDate'],
                           });
                        },
                        cost: trips[index]['cost'],
                      );
                    }, separatorBuilder: (BuildContext context, int index)=>SmallDivider().vPadding(8),),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
