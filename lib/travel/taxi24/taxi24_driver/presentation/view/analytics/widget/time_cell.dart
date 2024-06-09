import 'package:flutter/material.dart';


class AnalyticsTimeCell extends StatelessWidget {
  const AnalyticsTimeCell({Key? key, required this.time, required this.index}) : super(key: key);
final String time;
final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        getIt<AnalyticsViewModel>().geAnalytics(query: {"TimeRangeType":time});
        getIt<AnalyticsViewModel>().changeIndex(index);
        Navigator.pop(context);
      },
      child: Container(
        height: 56.h,
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CustomText(
                text: time.tr(),
                fontSize: FontSizer.s16,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w500,
              ),
            ),
             BlocBuilder<AnalyticsViewModel,AnalyticsState>(
               buildWhen: (previous,current)=>current.currentState=='ChangeIndex',
               builder: (context,state) {
                 return RadioWidget(value:  getIt<AnalyticsViewModel>().selectedIndex==index? true:false,);
               }
             ),
          ],
        ),
      ),
    );
  }
}
