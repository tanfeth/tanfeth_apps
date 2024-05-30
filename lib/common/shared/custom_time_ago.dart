

import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart';

class CustomArTimeAgo extends ArMessages {
  @override
  String months(int months) {
    if (months == 1) {
      return 'شهر';
    } else if (months == 2) {
      return 'شهرين';
    } else if (months > 2 && months < 11) {
      return '$months اشهر';
    } else if (months > 10) {
      return '$months شهر';
    }
    return '$months شهور';
  }

  @override
  String years(int years) {
    if (years == 1) {
      return 'سنة';
    } else if (years == 2) {
      return 'سنتين';
    } else if (years > 2 && years < 11) {
      return '$years سنوات';
    } else {
      return '$years سنة';
    }
  }
}

extension TimeOfDayConverter on TimeOfDay {
  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = this.minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}
