


import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/complete_trip/widget/payment_cell.dart';

class SelectBranchWidget extends ConsumerStatefulWidget{
  const SelectBranchWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_SelectBranchWidget();


}

class _SelectBranchWidget extends ConsumerState<SelectBranchWidget>{

  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(width: 1,
        color: context.color.onSurface)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            LangEnum.chooseBranch.tr(),
            style: context.text.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              // color:context.color.primary
            ),
          ),

          15.ph,

          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return   Row(
                  children: [
                    CircleAvatar(
                      radius: MySizes.defaultPadding * .7,
                      backgroundColor: context.color.primaryContainer,
                      child: CircleAvatar(
                        radius: MySizes.defaultPadding * .4,
                        backgroundColor:
                        isSelected ? context.color.primary : context.color.primaryContainer,
                      ),
                    ),
                    10.pw,
                    const Text(
                        'الدمام - المملكة العربية السعودية'
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => 10.ph,
              itemCount: 1),

        ],
      ),
    );
  }

}