


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';

class ConfirmPhotoView extends ConsumerStatefulWidget{
  const ConfirmPhotoView({super.key});



  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_ConfirmPhotoView();


}

class _ConfirmPhotoView extends ConsumerState<ConfirmPhotoView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.confirmPhoto.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [

                        10.ph,

                      ],
                    ),
                  ),
                ),

                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {

                      },
                      child: Text(LangEnum.confirm.tr()),
                    ),
                    20.ph,

                    ElevatedButton(
                      onPressed: () {

                      },
                      child: Text(LangEnum.reTakePhoto.tr()),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}