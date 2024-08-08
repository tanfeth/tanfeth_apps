


import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/view/onBoard/onBoard_view.dart';
import 'package:tanfeth_apps/common/shared/images.dart';

class CartCell extends ConsumerStatefulWidget{
  const CartCell({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_CartCell();

}

class _CartCell extends ConsumerState<CartCell>{
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: context.color.onSurface,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 60,
              width: 60,
              child: CircleAvatar(
                radius: 50.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child:  Image.asset(
                      Images.burger,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            20.pw,

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'سماش بووم',
                    style: context.text.bodyLarge,
                  ),

                  10.ph,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: context.color.primary,
                        size: 25,
                      ),

                      10.pw,
                      Text('1',
                        style: context.text.bodyLarge,),

                      10.pw,

                      Icon(
                        Icons.remove,
                        color: context.color.primary,
                        size: 25,
                      ),

                    ],
                  )
                ],
              ),
            ),

            Column(
              children: [
                Icon(
                  Icons.delete_forever,
                  size: 25,
                    color: context.color.primary,
                ),

                10.ph,
                Text(
                  '100 ريال',
                  style: context.text.bodyLarge,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}