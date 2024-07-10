import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/wallet_route.dart';


class HomeHeader extends ConsumerStatefulWidget{
  final GlobalKey one;
  final GlobalKey two;
  const HomeHeader({super.key, required this.one,
  required this.two});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomerHeader();
}

class _HomerHeader extends ConsumerState<HomeHeader>{
  @override
  Widget build(BuildContext context) {
    
   return  Column(
     children: [
       Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [

           Showcase(
             key: widget.one,
             description: LangEnum.menuOption.tr(),
             child:   Padding(
               padding: const EdgeInsets.symmetric(
                   vertical: 15,
                   horizontal: 15
               ),
               child: InkWell(
                 onTap: (){
                   Scaffold.of(context).openDrawer();
                 },
                 child: FadeInRight(
                   animate: true,
                   child: Container(
                     width: 50,
                     height: 50,
                     decoration: BoxDecoration(
                       color: context.color.primary.withOpacity(0.9),
                       shape: BoxShape.circle,
                     ),
                     child: Center(
                       child: Icon(
                         Icons.menu,
                         color: context.color.onPrimary,
                       ),
                     ),
                   ),
                 ),
               ),
             ),
           ),


           Showcase(
             key: widget.two,
             description: LangEnum.walletOption.tr(),
             child:  Padding(
               padding: const EdgeInsets.symmetric(
                   vertical: 15,
                   horizontal: 15
               ),
               child: GestureDetector(
                 behavior: HitTestBehavior.translucent,
                 onTap: (){
                   Get.toNamed(WalletRouting.config().path);
                 },
                 child: FadeInLeft(
                   animate: true,
                   child: Container(
                       alignment: Alignment.center,
                       height: 40,
                       padding: const EdgeInsets.symmetric(
                         vertical: 10,
                         horizontal: 15
                       ),
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
                         '0.0 ${LangEnum.sar.tr()}',
                         maxLines: 1,
                         style: context.text.bodyLarge?.copyWith(
                             color: context.color.surface,
                           height: 0.9
                         ),
                       )),
                 ),
               ),
             ),
           ),

         ],
       ),
       5.ph,

       Align(
         alignment: Alignment.center,
         child: InkWell(
           onTap: (){
             Get.toNamed(WalletRouting.config().path);
           },
           child: FadeInDown(
             animate: true,
             child: Container(
               margin: const EdgeInsets.symmetric(
                 horizontal: 10
               ),
               padding: const EdgeInsets.symmetric(
                 vertical: 8,
                 horizontal: 15
               ),
               decoration: BoxDecoration(
                   color: context.color.error.withOpacity(0.4),
                   borderRadius: BorderRadius.circular(40),),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Icon(
                     Icons.info,
                     size: 25,
                     color: context.color.onError,
                   ),
                   10.pw,
                   Expanded(
                     child: Text(
                       LangEnum.payYourExpenses.tr(),
                         textAlign:TextAlign.start,
                         style: context.text.bodyLarge?.copyWith(
                           color: context.color.onError
                         ),
                     
                     ),
                   ),
                 ],
               ),
             ),
           ),
         ),
       ),
     ],
   );
  }
}