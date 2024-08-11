



import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/helper_methods.dart';
import 'package:api_controller/shared/picker_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/confirm_order/vm/order_type_vm.dart';



class OrderTimeWidget extends ConsumerStatefulWidget{
  const OrderTimeWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_OrderTimeWidget();


}

class _OrderTimeWidget extends ConsumerState<OrderTimeWidget>{

  late FeedMeOrderTypeVM feedMeOrderTypeVM;
  late int selectedTime;

  String? dateTime;

  initBuild(){
    feedMeOrderTypeVM = ref.watch(feedMeDeliveryTimeProvider.notifier);
    selectedTime = ref.watch(feedMeDeliveryTimeProvider);
  }



  @override
  Widget build(BuildContext context) {
    initBuild();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          LangEnum.receivingTime.tr(),
          style: context.text.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            // color:context.color.primary
          ),
        ),
        10.ph,


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                splashColor: context.color.surface,
                onTap: (){
                  closeKeyBoard();
                  feedMeOrderTypeVM.changeIndex(currentIndex: 0);
                  dateTime = null;
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color:selectedTime == 0?
                      context.color.primary
                          :context.color.surface,
                      border: Border.all(width: 1,
                          color: context.color.onSurface)
                  ),
                  child:   Text(
                    LangEnum.oncePrepared.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:selectedTime == 0?
                      context.color.onPrimary
                          :context.color.onSurface,
                    ),
                  )
                ),
              ),
            ),

            15.pw,
            Expanded(
              child: InkWell(
                splashColor: context.color.surface,
                onTap: ()async{
                  closeKeyBoard();
                  TimeOfDay? time;
                  DateTime? date;

                  feedMeOrderTypeVM.changeIndex(currentIndex: 1);
                   date  = await AppPicker.date(context: context,
                  oldDatesOnly: false,
                  newDatesOnly: true);
                  if(date == null){
                    showFailed(msg: LangEnum.pleaseSelectDateTime.tr());
                    feedMeOrderTypeVM.changeIndex(currentIndex: 0);
                    dateTime = null;
                    setState(() {});
                  }else {
                       time  =  await AppPicker.time(context: context);
                      if(time == null){
                        showFailed(msg: LangEnum.pleaseSelectDateTime.tr());
                        feedMeOrderTypeVM.changeIndex(currentIndex: 0);
                        dateTime = null;
                        setState(() {});
                      }else {
                        dateTime = DateFormat("yyyy-MM-dd HH").format(date) +
                            time.format(context);
                        setState(() {});
                      }
                  }

                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color:selectedTime == 1?
                      context.color.primary
                          :context.color.surface,
                      border: Border.all(width: 1,
                          color: context.color.onSurface)
                  ),
                  child: Text(
                    (dateTime == null)?
                    LangEnum.delayed.tr():
                    dateTime??'',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:selectedTime == 1?
                      context.color.onPrimary
                          :context.color.onSurface,
                    ),
                  )
                ),
              ),
            ),


          ],
        ),
      ],
    );
  }

}