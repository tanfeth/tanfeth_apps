
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';

class Item extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const Item({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
            image,
            width: Get.width * .9,
            height: Get.width * .9),
        40.ph,
        Text(
          title,
          style: context.text.titleMedium,
          textAlign: TextAlign.center,
        ),
        10.ph,
        Text(
          description,
          style: context.text.titleSmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}