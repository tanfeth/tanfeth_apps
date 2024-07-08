
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/add_rider_instruction_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/RiderModel.dart';

class ChangeRiderTopSheet extends ConsumerStatefulWidget{
  const ChangeRiderTopSheet();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChangeRiderTopSheet();
  
  
}

class _ChangeRiderTopSheet extends ConsumerState<ChangeRiderTopSheet>{

   int riderSelectIndex=0;
   List<RiderModel> riderList =[];

   @override
  void initState() {
   for(int i =0 ; i < 3 ; i ++){
     RiderModel riderModel  = RiderModel();
     riderModel.name = 'عبدالرحمن';
     riderModel.id = i;
     riderModel.mobileNumber = '544646113';
     riderList.add(riderModel);
   }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.surface,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          50.ph,
          const Row(
            children: [
               BackButtonWidget(),
            ],
          ),

          Container(
            padding:  const EdgeInsets.symmetric(horizontal: 30),
            child: ListView.separated(
              itemCount: riderList.length+1,
              shrinkWrap: true,
              physics:const   NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return index != riderList.length?
                GestureDetector(
                  onTap: (){

                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Images.avatar,
                              width: 24,height: 24,
                            ),

                            15.pw,
                            Text(
                                riderList[index].name??'',
                                textAlign: TextAlign.center
                            ),
                          ],
                        ),
                      ),

                      Container(
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        decoration: index !=riderSelectIndex ?
                        BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color:
                           context.color.surfaceContainerHighest
                               .withOpacity(0.4),
                                width: 2)
                        ):BoxDecoration(
                            color: context.color.onSurface,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color:
                           context.color.primary,width: 6)
                        ),),

                    ],),
                ):
                GestureDetector(
                  onTap: (){
                    Get.back();
                    Get.toNamed(AddRiderInstructionRouting.config().path);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add,size: 24,
                        color: context.color.onSurface,),
                      const SizedBox(width: 16,),
                      Text(
                        LangEnum.addNewRider.tr(),

                      ),
                    ],
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 30,
                width: double.infinity,
              );
            },
            ),
          ),
          
          20.ph,

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
    );
  }
  
}