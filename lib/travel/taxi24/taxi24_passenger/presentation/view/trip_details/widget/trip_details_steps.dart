import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/images.dart';

class TripDetailsWidget extends StatelessWidget {
  const TripDetailsWidget({
    Key? key,
    required this.title,
    required this.description,
    this.isStart=false,
  }) : super(key: key);
  final String title;
  final String description;
  final bool isStart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(isStart? Images.pickUpSVG : Images.formFieldCircleSVG, width: 20, height: 20,),
        12.pw,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,overflow: TextOverflow.ellipsis,),
              4.ph,
              Text(description,overflow: TextOverflow.ellipsis,),
            ],
          ),
        ),
      ],
    );
  }
}
