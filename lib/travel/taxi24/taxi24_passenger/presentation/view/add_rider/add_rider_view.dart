import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/add_rider/widget/add_rider_form.dart';



class AddRiderView extends ConsumerStatefulWidget{
  const AddRiderView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddRiderView();

}

class _AddRiderView extends ConsumerState<AddRiderView>{

  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.addRider.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25,),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: AddRiderForm(
                      formKey:formKey
                    ),
                  ),
                ),

                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      closeKeyBoard();

                    }
                  },
                  child: Text(LangEnum.addRider.tr()),
                ),

                SizedBox(height: 8)
              ],
            ),
          ),
        ),
      ),
    );
  }

}