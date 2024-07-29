import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_controller/presentation/widget/progress_loading.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/custom_radio_widget.dart';

class TimeCell extends StatelessWidget {
  final String time;
  final int index;
  final BuildContext context;
  
  const TimeCell({Key? key, required this.time,
    required this.index,
  required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // getIt<AnalyticsViewModel>().geAnalytics(query: {"TimeRangeType": time});
        // getIt<AnalyticsViewModel>().changeIndex(index);
        Get.back();
      },
      child: Container(
        height: 56,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                time,
              ),
            ),

            CustomRadioWidget(
              value: false,
            ),

          ],
        ),
      ),
    );
  }
}
