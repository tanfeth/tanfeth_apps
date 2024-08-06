

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';

Color sheetColor({required int value,required BuildContext context}){
  if(value<=25){
    return context.color.error;
  } else if (value > 25 && value <= 66) {
    return  context.color.primary;
  }else {
    return context.color.onSurface;
  }
}

String formatMonthDay(DateTime date ,{DateTime? date2, int ?selectedIndex}) {
  DateTime now = DateTime.now();
  String month = DateFormat.MMMM().format(date); // Full month name
  String day = DateFormat.d().format(date);      // Day of the month
  // Compare the input date with today's date

  if (date.year == now.year && date.month == now.month && date.day == now.day) {
    return selectedIndex == 0 ?'Today' : selectedIndex ==2? 'This month' : '$month $day';
  } else {
    return '$month $day';
  }
}