import 'package:api_controller/shared/sizes.dart';
import 'package:flutter/material.dart';


class SocialButtonWidget extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color color;
  final Function()? onTap;

  const SocialButtonWidget({
    super.key,
    required this.icon,
    this.onTap,
    required this.backgroundColor,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: MySizes.buttonHeight * .4,
        backgroundColor: backgroundColor,
        child: Icon(icon, color: color, size: MySizes.defaultPadding * 1.4),
      ),
    );
  }
}
