import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/BankModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/bank/widget/bank_card.dart';

class BankView extends ConsumerStatefulWidget {
  const BankView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BankView();
}

class _BankView extends ConsumerState<BankView> {
  late BankModel bankModel;

  @override
  void initState() {
    bankModel = BankModel();
    bankModel.id = 1;
    bankModel.name = 'Test Bank';
    bankModel.bank = 'Test bank';
    bankModel.iBan = '1221erwq2341';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        child: bankModel.id != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LangEnum.bankAccount.tr(),
                    textAlign: TextAlign.start,
                    style: context.text.titleMedium,
                  ),
                  SizedBox(height: 16),
                  BankCard(
                    bankModel: bankModel,
                  ),
                ],
              )
            : Row(
                children: [
                  Center(
                      child: SvgPicture.asset(
                    Images.bankSVG,
                    height: 24,
                    width: 24,
                  )),
                  SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          LangEnum.addBankAccount.tr(),
                          textAlign: TextAlign.start,
                          style: context.text.titleMedium
                              ?.copyWith(color: context.color.onSurface),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          LangEnum.usedReceiveMoney.tr(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: context.color.surfaceContainerHighest),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        // Navigator.pushNamed(context,
                        //   RoutePath.addBankAccountScreen,);
                      },
                      child: Center(
                        child: Container(
                          height: 48,
                          width: 70,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: context.color.surfaceContainerHighest,
                                  width: 2),
                              borderRadius: BorderRadius.circular(24)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.add,
                                size: 16,
                                color: context.color.onSurface,
                              ),
                              Text(
                                LangEnum.add.tr(),
                                textAlign: TextAlign.start,
                                style: context.text.titleMedium
                                    ?.copyWith(color: context.color.onSurface),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ));
  }
}
