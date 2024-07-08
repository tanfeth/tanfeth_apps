import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/LocationModel.dart';


class TripCell extends ConsumerStatefulWidget {
  final LocationModel locationModel;
  final bool isRecent;
  const TripCell({required this.locationModel, required this.isRecent});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TripCell();
}

class _TripCell extends ConsumerState<TripCell> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          widget.isRecent == true ? Images.fullClockSVG :
          Images.locationPinSVG,
          width: 48,
          height: 48,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.locationModel.description ?? '',
                ),
                // SizedBox(
                //   height: 4,
                // ),
                // Text(
                //   widget.locationModel.locationCity ?? '',
                //   style:
                //       TextStyle(color: context.color.surfaceContainerHighest),
                // ),
              ],
            ),
          ),
        ),
        // GestureDetector(
        //   onTap: () {},
        //   child: SvgPicture.asset(
        //     (widget.locationModel.isFavorite ?? false)
        //         ? Images.heartFilledSVG
        //         : Images.heartSVG,
        //     width: 20,
        //     height: 17,
        //     colorFilter: ColorFilter.mode(context.color.primary, BlendMode.srcIn),
        //   ),
        // )
      ],
    );
  }
}
