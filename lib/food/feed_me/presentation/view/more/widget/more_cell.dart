



import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/sizes.dart';
import 'package:api_controller/vm/langauge/langauge_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tanfeth_apps/food/feed_me/data/model/more/MoreModel.dart';

class MoreCell extends ConsumerWidget{
  final MoreModel moreModel;
 final Widget? trailingWidget;
  const MoreCell({super.key,
    required this.moreModel,
    this.trailingWidget
   });


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return InkWell(
      onTap: moreModel.onPress??(){},
      child: Row(
        children: [

          Expanded(
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Image.asset(
                      moreModel.icon??''
                    ),
                  ),
                ),
                10.pw,
                Text(moreModel.name??'',
                style: context.text.bodyLarge,)
              ],
            ),
          ),


          if(trailingWidget != null)
            trailingWidget?? const SizedBox.shrink(),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Icon(
          //     ref.watch(languageProvider) == 'ar' ? LineIcons.angleLeft : LineIcons.angleRight,
          //     size: 20,
          //     color: context.color.onSurface,
          //   ),
          // ),


        ],
      ),
    );
  }

}