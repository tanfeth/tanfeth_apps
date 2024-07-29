import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:api_controller/vm/langauge/langauge_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyTripsCell extends ConsumerWidget {
  final String status;
  final String title;
  final String time;
  final String cost;
  final VoidCallback function;
  const MyTripsCell({
    Key? key,
    required this.title,
    required this.status,
    required this.time,
    required this.cost,
    required this.function}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: function,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(Images.tripCarSVG, width: 48, height: 48,),
          12.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(title,),
                Row(
                  children: [
                    Text('${cost}'),
                    Text(' - ${status}'),
                  ],
                ).vPadding(2),
                Text(formatTimestamp(time),),
              ],
            ),
          ),
          SvgPicture.asset(ref.watch(languageProvider) == 'en'?Images.arrowSVG : Images.arrowLeftSVG, width: 24, height: 24,),
        ],
      ),
    );
  }
}