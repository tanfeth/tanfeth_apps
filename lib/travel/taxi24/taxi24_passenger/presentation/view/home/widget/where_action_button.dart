



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/destination_route.dart';

class WhereActionButton extends StatelessWidget {
  const WhereActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return     Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: FloatingActionButton.extended(
        label: Text(LangEnum.whereTo.tr()),
        icon: Icon(Icons.navigation),
        backgroundColor: context.color.primary,
        onPressed: (){
          Get.toNamed(DestinationRouting.config().path);
        },
      ),
    );
  }
}
