import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/button_extensions.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/trip_details_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/widget/small_divider.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/widget/map_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/trip_details/widget/payment_raw_data.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/trip_details/widget/person_info.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/trip_details/widget/raw_data.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/trip_details/widget/trip_details_steps.dart';

class TripDetailsView extends StatefulWidget {
   const TripDetailsView({Key? key}) : super(key: key);
  @override
  State<TripDetailsView> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsView> {
  late int orderId;
  late String orderTime;
  @override
  void initState() {
    orderId = int.parse(Get.parameters[TripDetailsRouting.tripId] ?? '');
    orderTime = Get.parameters[TripDetailsRouting.orderTime] ?? '';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title:formatTimestamp(orderTime) ,leadingWidget: BackButtonWidget()),
      body: SafeArea(
        child: WebWidth(
          isCenter: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // map
              SizedBox(
                height: 185,
                child:MapWidget()
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                
                  child: Padding(
                    padding: 24.toHorizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // person info
                        PersonInfo(),
                
                        Text(LangEnum.tripDetails.tr(),style: context.text.titleMedium,),
                
                        12.ph,
                
                        // list of location point
                        ...List.generate(2, (index)=>  TripDetailsWidget(
                          isStart: index==0?true:false,
                          title: "Near EMAA4551",
                          description: "Dammam, Eastern province, SaudiDammam",).vPadding(16)),
                
                        16.ph,
                
                        // car type
                        RawData(text: "Sedan", icon: Images.carSVG),
                
                        Text(LangEnum.paymentDetails.tr(),style :context.text.titleMedium,).vPadding(24),
                
                        // payment way
                        RawData(text: LangEnum.cash.tr(), icon: Images.cashSVG),
                
                        12.ph,
                        // payment report
                        Theme(
                          data: Theme.of(context).copyWith(
                            dividerColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            title:  Text(LangEnum.total.tr()+ " : "+"23 ريال",style: context.text.titleMedium,),
                            children: [
                              PaymentRawData(title: LangEnum.tripCost.tr(),value: "23 ريال",).vPadding(16),
                              PaymentRawData(title: LangEnum.waitTme.tr(),value: "23 ريال",),
                              PaymentRawData(title: LangEnum.balance.tr(),value: "23 ريال",).vPadding(16),
                              PaymentRawData(title: LangEnum.promoCode.tr(),value: "23 ريال",),
                              SmallDivider().vPadding(16),
                              PaymentRawData(title: LangEnum.total.tr(),value: "23 ريال",),
                            ],
                          ),
                        ),
                        50.ph,
                        ElevatedButton(
                          style: const ButtonStyle().GreyOutlinedButton(context)?.copyWith(
                            backgroundColor: WidgetStateProperty.all<Color?>(context.color.surface),
                            foregroundColor: WidgetStateProperty.all<Color?>(context.color.onSurface),
                          ),
                          onPressed: () {},
                          child: Text(LangEnum.reportTrip.tr(),style: context.text.bodyLarge,),
                        ),
                        24.ph,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
