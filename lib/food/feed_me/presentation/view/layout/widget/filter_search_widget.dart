


import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/vm/resturant_list_vm.dart';


class FilterSearchWidget extends ConsumerStatefulWidget{
  const FilterSearchWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_FilterSearchWidget();

}


class _FilterSearchWidget extends ConsumerState<FilterSearchWidget>{

   String selectedVal = 'الاسم';
   final searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Row(
          children: [
            PopupMenuButton<String>(
              onSelected: (val){
                closeKeyBoard();
                selectedVal = val;
                ref.read(restaurantListProvider.notifier)
                    .changeLoading(loading: true);

                Future.delayed(const Duration(seconds: 1),(){
                  ref.read(restaurantListProvider.notifier)
                      .changeLoading(loading: false);
                });

                setState(() {});
              },
             icon:  Icon(
               Icons.filter_list,
               size: 25,
                 color: context.color.surfaceContainerHighest
             ),
              itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'الاسم',
                  textStyle: context.text.bodyMedium,
                  child: Text('الاسم',
                  style: context.text.bodyMedium?.copyWith(
                      color: context.color.surfaceContainerHighest
                  ),),
                ),

                PopupMenuItem<String>(
                  value: 'الاحدث',
                  textStyle: context.text.bodyMedium,
                  child: Text('الاحدث',
                    style: context.text.bodyMedium?.copyWith(
                        color: context.color.surfaceContainerHighest
                    ),),
                ),


              ]

            ),

            Text(selectedVal,
             style: context.text.bodyLarge?.copyWith(
               color: context.color.surfaceContainerHighest
             ),),
          ],
        ),

        10.pw,

        ///Search
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 50,
              child: CustomTextFormField(
                  controller: searchController,
                  fillColor: context.color.surface,
                  onFieldSubmitted: (val){
                    ref.read(restaurantListProvider.notifier)
                        .changeLoading(loading: true);

                    Future.delayed(const Duration(seconds: 1),(){
                      ref.read(restaurantListProvider.notifier)
                          .changeLoading(loading: false);
                    });
                  },
                  keyboardType: TextInputType.text,
                  hintText: LangEnum.search.tr(),
                  prefixIcon: Icons.search,
                  textInputAction: TextInputAction.search,
                  suffixIcon: searchController.text.isNotEmpty?
                  Icons.clear:null,
                  suffixOnTap: (){
                    closeKeyBoard();
                    searchController.clear();
                    setState(() {});
                  },
                  onChanged: (String value) {

                  }),
            ),
          ),
        ),


      ],
    );
  }
}