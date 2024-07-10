


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/find_driver/widget/searching_driver_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/vm/toggle_animation_vm.dart';

class SearchingTripWidget extends ConsumerStatefulWidget{
  const SearchingTripWidget({super.key});


  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _SearchingTripWidget();

}

class _SearchingTripWidget extends ConsumerState<SearchingTripWidget>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          color: context.color.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ///Searching
          const SearchingDriverWidget(),

          8.ph,
          ///Go offline
          ElevatedButton(
            onPressed: () async {

              ref.read(toggleAnimationProvider.notifier)
                  .toggleConfirmFooterAnimate(true);

              ref.read(toggleAnimationProvider.notifier)
                  .toggleTripFooterAnimate(false);


            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color?>(context.color.error),
            ),
            child: Text(LangEnum.goOffline.tr()),
          ),
          5.ph,
        ],
      ),
    );
  }

}