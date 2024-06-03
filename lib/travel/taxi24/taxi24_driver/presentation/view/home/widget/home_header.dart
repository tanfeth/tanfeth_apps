import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/profile_routing.dart';

class HomeHeader extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomerHeader();
}

class _HomerHeader extends ConsumerState<HomeHeader>{
  @override
  Widget build(BuildContext context) {
    
   return  Row(
     mainAxisAlignment: MainAxisAlignment.start,
     children: [
       GestureDetector(
         behavior: HitTestBehavior.translucent,
         onTap: () {
           Get.toNamed(ProfileRouting.config().path);
         },
         child: Container(
           height: 50,
           width: 50,
           decoration: BoxDecoration(
               color: context.color.surface,
               borderRadius: BorderRadius.circular(24),
               boxShadow: [
                 BoxShadow(
                   color: context.color.surface.withOpacity(0.4),
                   blurRadius: 15,
                   offset: const Offset(0, 4), // changes position of shadow
                 ),
               ]),
           child: Icon(
             Icons.menu,
             color: context.color.onSurface,
             size: 24,
           ),
         ),
       ),
       71.pw,
       GestureDetector(
         behavior: HitTestBehavior.translucent,
         onTap: (){},
         child: Container(
             alignment: Alignment.center,
             height: 48,
             width: 113,
             decoration: BoxDecoration(
                 color: context.color.onSurface,
                 borderRadius: BorderRadius.circular(40),
                 boxShadow: [
                   BoxShadow(
                     color: context.color.surface.withOpacity(0.4),
                     blurRadius: 24,
                     offset: const Offset(
                         0, 4), // changes position of shadow
                   ),
                 ]),
             child: Text(
               '0.0 SAR',
               style: context.text.bodyLarge?.copyWith(
                 color: context.color.surface
               ),
             )),
       ),
     ],
   );
  }
}