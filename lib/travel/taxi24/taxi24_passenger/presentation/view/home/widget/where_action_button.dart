



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/destination_route.dart';
import 'package:animate_do/animate_do.dart';
class WhereActionButton extends StatelessWidget {
  const WhereActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return     Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: FloatingActionButton.extended(
        label: Text(LangEnum.whereTo.tr()),
        icon: ShakeY(
            infinite: true,
            duration: const Duration(milliseconds: 10000),
            child: Icon(Icons.navigation)),
        backgroundColor: context.color.primary,
        onPressed: (){
          Get.toNamed(DestinationRouting.config().path);
        },
      ),
    );
  }
}
