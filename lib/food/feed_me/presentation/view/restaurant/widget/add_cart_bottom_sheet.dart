
import 'package:api_controller/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/helper_methods.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';



class AddCartBottomSheet extends ConsumerStatefulWidget{
  const AddCartBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_AddCartBottomSheet();


}


class _AddCartBottomSheet extends ConsumerState<AddCartBottomSheet>{

  final notesController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          10.ph,
          const Center(child: CloseBottomSheetWidget()),
          10.ph,

          ///Item
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1,
                      color: context.color.primary),
                  image: DecorationImage(
                      image: AssetImage(Images.resturant),
                      fit: BoxFit.fill
                  ),
                ),
              ),

              10.pw,
              Text("بيتزا مارجريتا",
                style: context.text.bodyLarge,),



            ],
          ),


          10.ph,

          ///Quantity
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: context.color.primary,
                        size: 25,
                      ),

                      10.pw,
                      Text('1',
                        style: context.text.bodyLarge,),

                      10.pw,

                      Icon(
                        Icons.remove,
                        color: context.color.primary,
                        size: 25,
                      ),

                    ],
                  )
              ),

              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius:const  BorderRadius.all(Radius.circular(15)),
                  border: Border.all(width: 1,
                  color: context.color.primary)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(LangEnum.total.tr(),
                      style: context.text.bodyLarge,),

                    10.pw,
                    const  Text("200 ريال")
                  ],
                ),
              ),



            ],
          ),

          20.ph,

          SizedBox(
            height: 50,
            child: CustomTextFormField(
                controller: notesController,
                fillColor: context.color.surface,
                onFieldSubmitted: (val){
                },
                keyboardType: TextInputType.text,
                hintText: LangEnum.addNotesOptions.tr(),
                prefixIcon: Icons.edit_note_sharp,
                textInputAction: TextInputAction.done,
                onChanged: (String value) {

                }),
          ),


          15.ph,
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed:() async {
                showSuccess(msg: LangEnum.addedToCart.tr());
                Get.back();
              },
              child: Text(LangEnum.addToCart.tr()),
            ),
          ),




        ],
      ),
    );
  }

}