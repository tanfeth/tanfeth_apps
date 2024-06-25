import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/widget/previous_trip_list.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

class PreviousTrips extends ConsumerStatefulWidget {
  const PreviousTrips();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PreviousTrips();
}

class _PreviousTrips extends ConsumerState<PreviousTrips> {

  @override
  Widget build(BuildContext context) {
     var statusBar = MediaQuery.of(context).viewPadding.top;


     return Padding(
       padding:  EdgeInsets.only(top: statusBar),
       child: GestureDetector(
         onTap: ()async{
           await showTopModalSheet<String?>(context,
               Container(
                 decoration: BoxDecoration(
                   color: context.color.surface,
                   borderRadius: BorderRadius.only(
                     bottomLeft: Radius.circular(30),
                     bottomRight: Radius.circular(30)
                   )
                 ),
                 child: ConstrainedBox(
                   constraints: BoxConstraints(
                     maxHeight: 350,
                   ),
                   child: Column(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Expanded(
                         child: Padding(
                           padding: EdgeInsets
                               .symmetric(horizontal: 15),
                           child: PreviousTripList(),
                         ),
                       ),
                       10.ph,
                       Center(
                         child: GestureDetector(
                           behavior: HitTestBehavior.translucent,
                           onTap: () {
                             Get.back();
                           },
                           child: Center(
                               child: Text(
                                 LangEnum.close.tr(),
                                 style: context.text.titleMedium,
                               )
                           ),
                         ),
                       ),
                       30.ph,
                     ],
                   ),
                 ),
               ),
               barrierDismissible: false);

         },
         child: Container(
           margin: EdgeInsets.symmetric(horizontal: 100),
           height: 40,
           width: 150,
           decoration: BoxDecoration(
             color: context.color.primary,
             borderRadius: BorderRadius.all(Radius.circular(30)),
           ),
           child: Center(
             child: Text(
               LangEnum.previousTrips.tr(),
               textAlign: TextAlign.center,
               style: context.text.titleMedium
                   ?.copyWith(color: context.color.onPrimary),
             ),
           ),
         ),
       ),
     );

  }
}
