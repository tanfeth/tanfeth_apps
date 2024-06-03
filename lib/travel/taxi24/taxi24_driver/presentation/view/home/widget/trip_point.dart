import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';


class TripPoint extends StatelessWidget {
  final String tripTitle;
  final String tripDescription;
  final Color tripPoint;
  const TripPoint({
    required this.tripTitle,
    required this.tripDescription,
    required this.tripPoint,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          height: 16,
          width: 16,
          margin: Localizations.localeOf(context).toString()=="en"?
          EdgeInsets.only(right: 16):
          EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: tripPoint
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  tripTitle,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.color.onSurface
                ),
                overflow: TextOverflow.ellipsis,
              ),
              4.ph,

              Text(
                tripDescription,
                style: context.textTheme.bodyMedium?.copyWith(
                    color: context.color.onSurface.withOpacity(0.3)
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
