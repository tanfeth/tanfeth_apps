


import 'package:api_controller/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:api_controller/presentation/widget/shimmer_widget.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';

class PassengerBottomContent extends ConsumerStatefulWidget{
  const PassengerBottomContent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PassengerBottomContent();


}

class _PassengerBottomContent extends
ConsumerState<PassengerBottomContent>{


  List<int> passengerCountList = [4,7];
  ScrollController controller  =ScrollController();
   int selectedIndex  =0 ;


  @override
  Widget build(BuildContext context) {

    return Container(
      height: 300,
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          10.ph,
          const Center(child: CloseBottomSheetWidget()),
          10.ph,


          Text(LangEnum.passengerCount.tr(),
            style: context.text.bodyLarge,),

          10.ph,
          Expanded(
            child: ListView.separated(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const  SizedBox(height: 10,),
              itemCount: passengerCountList.length,
              itemBuilder: (context,index){
                if (index >= passengerCountList.length){
                  return const ShimmerWidget(
                    height: 35,
                    width: double.infinity,
                    borderRadius:  BorderRadius.all(Radius.circular(8)),
                  );
                }else{
                  return InkWell(
                    splashColor: context.color.surface,
                    onTap: (){
                      selectedIndex = index;
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [

                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  passengerCountList[index].toString(),
                                  style: context.text.bodyLarge,
                                ),

                                10.pw,

                                Text(
                                    LangEnum.passenger.tr()
                                )
                              ],
                            ),
                          ),


                          Checkbox(
                            shape: const CircleBorder(),
                            tristate: true,
                            isError: true,
                            activeColor: context.color.primary,
                            value: selectedIndex == index,
                            onChanged: (bool? value){
                              selectedIndex = index;
                              setState(() {});
                            },
                          ),


                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),


          ElevatedButton(
            onPressed: ()async {
              Get.back();

            },
            child: Text(LangEnum.confirm.tr()),
          ),
        ],
      ),
    );
  }

}