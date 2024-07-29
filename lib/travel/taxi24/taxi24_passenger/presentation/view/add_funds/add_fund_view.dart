import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:api_controller/presentation/widget/divider.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/my_cards_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/add_funds/widget/static_list_amount.dart';

class AddFunds extends StatefulWidget {
  const AddFunds({super.key});

  @override
  State<AddFunds> createState() => _AddFundsState();
}

class _AddFundsState extends State<AddFunds> {
  final _amountController = TextEditingController();
  bool isDisable=true;
  int ? selectedAmount;
  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      appBar: MainAppBar(title: LangEnum.wallet.tr(),leadingWidget:  const BackButtonWidget()),
      body: WebWidth(
        child: Padding(
          padding:(24,16).toSymmetric,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                hintText: "Amount",
                controller: _amountController,
                onChanged: (String value) {
                  selectedAmount=null;
                  setState(() {});
                },
                suffixWidget:_amountController.text.isNotEmpty? GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _amountController.clear();
                    selectedAmount=null;
                    setState(() {});
                  },
                  child:  Icon(Icons.close,color: context.color.onSurface,),
                ):null,
              ),
              24.ph,
              StaticListAmount(selectedAmount: selectedAmount,onAmountSelected: (int? value) {
                if(value==null){
                  _amountController.clear();
                }else{
                  _amountController.text="${value}";
                }
              }, ),
              const LargeDivider().vPadding(24),
              Text("Pay with",style: context.text.titleMedium,),
              24.ph,
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (){
                  Get.toNamed(MyCardsRouting.config().path);
                },
                child: Row(
                  children: [
                      Expanded(child: Text("Choose payment method",style: context.text.titleSmall,)),
                      SvgPicture.asset(Images.arrowSVG)
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: ()async {},
                child: Text(LangEnum.confirm.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}