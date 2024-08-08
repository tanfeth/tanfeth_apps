

import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuWidget extends ConsumerWidget{
  const MenuWidget({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child:InkWell(
          onTap: (){
            Scaffold.of(context).openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.menu,
              size: 25,
              color: context.color.onPrimary,
            ),
          ),
        )
    );
  }

}