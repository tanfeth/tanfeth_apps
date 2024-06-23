import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/widget/destination_header.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/widget/destination_list.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/widget/set_on_map_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/widget/where_to_go_widget.dart';

class DestinationView extends ConsumerStatefulWidget{
  const DestinationView();
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DestinationView();

}

class _DestinationView extends ConsumerState<DestinationView>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
       titleWidget: DestinationHeader(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Stack(
              children: [
                Column(
                  children: [
                    20.ph,
                    WhereToGoWidget(),
                    20.ph,
                    SizedBox(height:16),
                    Expanded(
                        child:DestinationList(),
                    ),
                  ],
                ),

                SetOnMapWidget(),

                // RotatedBox(
                //   quarterTurns: 2,
                //   child: CustomSlidePanel(
                //     minHeight:300,
                //     maxHeight:300,
                //     child: RotatedBox(
                //       quarterTurns: 2,
                //       child: Column(
                //         children: [
                //           Expanded(
                //             child: Padding(
                //               padding:  EdgeInsets.symmetric(
                //                   horizontal: 24,vertical:24 ),
                //               child: ListView.separated(
                //                 itemCount: viewModelider.length+1,
                //                 itemBuilder: (context,index){
                //                   return index!=viewModelider.length?
                //                   GestureDetector(
                //                     onTap: (){
                //
                //                     },
                //                     child: Row(
                //                       children: [
                //                         CustomSvgImage(image: AssetsManager.avatar,width: 24,height: 24,),
                //                         Padding(
                //                           padding:  EdgeInsets.only(left: 8),
                //                           child: CustomText(text:viewModelider[index].name!,fontWeight: FontWeightManager.medium,fontSize: FontSizer.s16,textAlign: TextAlign.center,),
                //                         ),
                //                         const Spacer(),
                //                         Container(
                //                           height: 20,
                //                           width: 20,
                //                           alignment: Alignment.center,
                //                           decoration: index !=riderSelectIndex ?
                //                           BoxDecoration(
                //                               borderRadius: BorderRadius.circular(16),
                //                               border: Border.all(color: ColorsManager.dividerColor,width: 2)
                //                           ):BoxDecoration(
                //                               color: ColorsManager.blackColor,
                //                               borderRadius: BorderRadius.circular(16),
                //                               border: Border.all(color: ColorsManager.baseOrange,width: 6)
                //                           ),),
                //
                //                       ],),
                //                   ):
                //                   GestureDetector(
                //                     onTap: (){
                //                       Navigator.pushNamed(context, RoutePath.addRiderScreen);
                //                     },
                //                     child: Row(
                //                       children: [
                //                         Icon(Icons.add,size: 24,color: ColorsManager.blackColor,),
                //                         SizedBox(width: 16,),
                //                         CustomText(text: "Add new rider",fontSize: FontSizer.s16,fontWeight: FontWeightManager.medium,)
                //                       ],
                //                     ),
                //                   );
                //                 }, separatorBuilder: (BuildContext context, int index) {
                //                 return SizedBox(
                //                   height: 30,
                //                   width: double.infinity,
                //                 );
                //               },
                //               ),
                //             ),
                //           ),
                //
                //           GestureDetector(
                //               onTap: (){
                //               },
                //               child: CustomText(text: "Close",
                //                 fontSize: FontSizer.s18,
                //                 fontColor: ColorsManager.blackColor,fontWeight: FontWeightManager.bold,)),
                //           SizedBox(height: 37,)
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}