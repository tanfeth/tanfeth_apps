
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';

class PaymentBuildMethod extends ConsumerWidget{
  final  String icon;
  final String title;
  final double svgHeight;
  final Color? color;
  final Widget trailing;


  const PaymentBuildMethod({super.key,
    required this.icon,
    required this.title,
    required this.svgHeight,
    required this.color,
    required this.trailing,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                SvgPicture.asset(
                  icon,
                  width: 20,
                  height: svgHeight,
                  colorFilter:ColorFilter.mode(
                      color??context.color.primary,
                      BlendMode.srcIn) ,
                ),

                SizedBox(
                  width: 18,
                ),
                Text(
                  title
                ),
              ],
            ),
          ),

          const Spacer(),
          trailing,
        ],
      ),
    );
  }
}