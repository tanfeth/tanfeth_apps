



import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/food/feed_me/data/model/offers/OfferModel.dart';

class OfferCell extends ConsumerStatefulWidget{
  final OfferModel model;
  const OfferCell({super.key,required this.model});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_OfferCell();

}

class _OfferCell extends ConsumerState<OfferCell>{
  @override
  Widget build(BuildContext context) {
   return Container(
     height: 250,
     width: double.infinity,
     margin: const EdgeInsets.symmetric(
         horizontal: 20,
         vertical: 8
     ),
     decoration: BoxDecoration(
         borderRadius: const BorderRadius.all(Radius.circular(10)),
         image: DecorationImage(
           fit: BoxFit.fill ,
           image:
           AssetImage(widget.model.image??''),),
         border: Border.all(
             width: 1,
             color: context.color.error
         )
     ),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.end,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Container(
           alignment: Alignment.bottomCenter,
           padding: const EdgeInsets.all(10),
           decoration: BoxDecoration(
               borderRadius:  const BorderRadius.only(
                 bottomLeft: Radius.circular(10),
                 bottomRight: Radius.circular(10),),
               gradient: LinearGradient(
                   colors: [
                   Colors.black.withOpacity(0.7),
                   Colors.black.withOpacity(0.5),],
                   begin: Alignment.bottomCenter,
                   end: Alignment.topCenter
               )
           ),
           child: Row(
             children: [
               Expanded(
                 child: Row(
                   children: [
                   CircleAvatar(
                     radius: 16.0,
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(50.0),
                       child:  Image.asset(
                         Images.appLogo
                       ),
                     ),
                   ),

                   10.pw,

                   const Text(
                     'بايسون برجر',
                     style: TextStyle(
                       color: Colors.white
                     ),
                   )
                   ],
                 ),
               ),

               Text(
                 'ينتهى بعد 5 ايام',
                 style: context.text.bodyLarge?.copyWith(
                   color: context.color.secondary
                 ),
               )
             ],
           ),
         ),

         Container(
           width: double.infinity,
           padding: const EdgeInsets.all(5),
           decoration: const BoxDecoration(
               borderRadius:  BorderRadius.only(
                 bottomLeft: Radius.circular(10),
                 bottomRight: Radius.circular(10),),
                color: Colors.white
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
                Text(
                 'عروض جديدة من بايسون برجر',
                  maxLines: 1,
                 textAlign: TextAlign.start,
                 style:context.text.titleMedium?.copyWith(
                     color: Colors.black
                 ),
                               ),

               5.ph,
               Text(
                 ' بايسون برجرعامل عروض بتبدا من 20 ريال ',
                 textAlign: TextAlign.start,
                 maxLines: 1,
                 style:TextStyle(
                     color: context.color.surfaceContainerHighest
                 ),
               ),


             ],
           ),
         ),
       ],
     ),
   );
  }

}