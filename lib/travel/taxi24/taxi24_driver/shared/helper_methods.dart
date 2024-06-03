

import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';

Color sheetColor({required int value,required BuildContext context}){
  if(value<=25){
    return context.color.error;
  } else if (value > 25 && value <= 66) {
    return  context.color.primary;
  }else {
    return context.color.onSurface;
  }
}

