
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/analytics_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/trips_route.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/helper_methods.dart';

class EarningView extends ConsumerStatefulWidget{
  const EarningView();
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EarningView();
  
}

class _EarningView extends ConsumerState<EarningView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.earnings.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding:  EdgeInsets.symmetric(horizontal:24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient:  LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            context.color.primary,
                            context.color.primary.withOpacity(0.4),
                          ])),
                  child:Column(
                    crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      SizedBox(height: 22,),
                      Text(
                        formatMonthDay(DateTime.now().toLocal()),
                      ),
                      SizedBox(height: 12,),
                      Text(
                        "${LangEnum.sar.tr()} ${1000.toStringAsFixed(2)}",
                        style: context.text.titleMedium,
                      ),
                      SizedBox(height: 16,),
                      Text(
                        "${1000} ${LangEnum.trips.tr()} ${LangEnum.inWord.tr()} ${LangEnum.today.tr()}",
                      ),
                      SizedBox(height: 24,),
                    ],
                  ),
                ),
                SizedBox(height: 34,),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                      Get.toNamed(AnalyticsRouting.config().path);
                    },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Images.activitySVG,
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(width: 18,),
                            Text(
                              LangEnum.analytics.tr(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: context.color.onSurface
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios,size: 16,)
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    Get.toNamed(TripsRouting.config().path);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Images.recentClock,
                              width: 24,
                                height: 24,
                            ),
                            SizedBox(width: 18,),
                            Text(
                              LangEnum.myTrips.tr(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: context.color.onSurface
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios,size: 16,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}