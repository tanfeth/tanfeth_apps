



import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
     width: double.infinity,
     margin: const EdgeInsets.symmetric(
         horizontal: 20,
         vertical: 8
     ),
     decoration: BoxDecoration(
         borderRadius: const BorderRadius.all(Radius.circular(8)),
         border: Border.all(
             width: 1,
             color: context.color.error
         )
     ),
     child: Column(
       children: [
         Container(
           height: 200,
           width: double.infinity,
           decoration: const BoxDecoration(
             borderRadius:  BorderRadius.only(
                 topRight: Radius.circular(8),
             topLeft: Radius.circular(8),),
           ),
           child: Image.asset(
               widget.model.image??'',
             width: double.infinity,
             fit: BoxFit.fill
           ),
         ),
       ],
     ),
   );
  }

}