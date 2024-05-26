

import 'package:flutter/material.dart';
int MinusWebWidth=0;
int GridCount(BuildContext context, {int initial = 1,double extraWidth=0}) {
  double width = MediaQuery.of(context).size.width-MinusWebWidth-extraWidth;
  print(width);
  if (width < 450)
    return initial;
  else if (width < 800)
    return initial + 1;
  else if (width < 1150)
    return initial + 2;
  else
    return initial + 3;
}
