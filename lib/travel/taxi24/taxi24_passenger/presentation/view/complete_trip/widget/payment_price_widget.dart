import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/complete_trip/widget/price_cell.dart';

class PaymentPriceWidget extends StatelessWidget {
  const PaymentPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        30.ph,
        PriceCell(
          title: LangEnum.total.tr(),
          isLoading: false,
          value: "50 ${LangEnum.sar.tr()}",
        ),
        8.ph,
        PriceCell(
          value: "50 ${LangEnum.sar.tr()}",
          isLoading: false,
          title: LangEnum.discountCouponValue.tr(),
        ),
        8.ph,
        PriceCell(
          value: "50 ${LangEnum.sar.tr()}",
          isLoading: false,
          title: LangEnum.costValueAfterDiscount.tr(),
        ),
        8.ph,
        PriceCell(
          value: "50 ${LangEnum.sar.tr()}",
          title: LangEnum.valueAddedTax.tr(),
          isLoading: false,
        ),
        8.ph,


        PriceCell(
          value: "10%",
          isLoading: false,
          title: LangEnum.discountPercentage.tr(),
        ),
        8.ph,
        PriceCell(
          value: "200 ${LangEnum.sar.tr()}",
          title: LangEnum.totalDue.tr(),
          textColor: context.color.secondary,
          isLoading: false,
        ),
        8.ph,
      ],
    );
  }
}
