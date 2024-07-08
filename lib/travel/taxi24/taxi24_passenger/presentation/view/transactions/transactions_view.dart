import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/presentation/widget/monthes_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/widget/small_divider.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/transactions/widget/empty_transactions.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/transactions/widget/transaction_item.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {

  List transactions = [
    {
      'id':1,
      'transactionType':"purchase",
      'process':"You added money",
      'amount':"120 SAR"
    },
    {
      'id':2,
      'transactionType':"Add",
      'process':"You added money",
      'amount':"120 SAR"
    },
    {
      'id':3,
      'transactionType':"Add",
      'process':"You paid for a trip",
      'amount':"-120 SAR"
    },
    {
      'id':4,
      'transactionType':"purchase",
      'process':"You paid for a trip",
      'amount':"-100 SAR"
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.transactions.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: Padding(
          padding:24.toHorizontal,
          child: transactions.isEmpty ? EmptyTransactions()  : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: MonthsWidget(callBack: (DateTime ) {
                  print(DateTime);}),
              ),
              20.ph,
              Expanded(
                child: ListView.separated(
                  itemCount: transactions.length,
                  itemBuilder: (context, index)  {
                    return  TransactionItem(transaction:transactions[index],);
                  }, separatorBuilder: (BuildContext context, int index)=>SmallDivider().vPadding(8),),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
