import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/presentation/widget/divider.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/bank/bank_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/card/card_view.dart';

class PaymentMethodView extends ConsumerStatefulWidget {
  const PaymentMethodView();
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaymentMethodView();
}

class _PaymentMethodView extends ConsumerState<PaymentMethodView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.paymentMethod.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CardView(),
                const LargeDivider(),
                const BankView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
