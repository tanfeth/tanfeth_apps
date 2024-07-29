import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/widget/previous_trip_list.dart';



class PreviousTrips extends ConsumerStatefulWidget {
  const PreviousTrips({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PreviousTrips();
}

class _PreviousTrips extends ConsumerState<PreviousTrips> {

  @override
  Widget build(BuildContext context) {
     var statusBar = MediaQuery.of(context).viewPadding.top;


     return Padding(
       padding:  EdgeInsets.only(top: statusBar),
       child: Container(
         decoration: BoxDecoration(
             color: context.color.surface,
             borderRadius: const BorderRadius.only(
                 bottomLeft: Radius.circular(30),
                 bottomRight: Radius.circular(30)
             )
         ),
         child: ConstrainedBox(
           constraints: const BoxConstraints(
             maxHeight: 350,
           ),
           child: Column(
             mainAxisSize: MainAxisSize.min,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               25.ph,
               Text(
                 LangEnum.previousTrips.tr(),
                 style: context.text.titleMedium,
               ),
               25.ph,
               const Expanded(
                 child: Padding(
                   padding: EdgeInsets.symmetric(horizontal:8),
                   child: PreviousTripList(),
                 ),
               ),
             ],
           ),
         ),
       ),
     );

  }
}
