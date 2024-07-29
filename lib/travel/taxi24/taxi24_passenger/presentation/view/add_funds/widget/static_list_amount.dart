import 'package:flutter/material.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';

class StaticListAmount extends StatefulWidget {
  int? selectedAmount;
  final ValueChanged<int?> onAmountSelected;

   StaticListAmount({
    required this.onAmountSelected,
    required this.selectedAmount,
    super.key,
  });

  @override
  _StaticListAmountState createState() => _StaticListAmountState();
}

class _StaticListAmountState extends State<StaticListAmount> {

  final List<int> amountList = const [
    50,
    100,
    150,
    200,
    250,
    300,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        itemCount: amountList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                if (widget.selectedAmount == amountList[index]) {
                  widget.selectedAmount = null;
                } else {
                  widget.selectedAmount = amountList[index];
                }
              });
              widget.onAmountSelected(widget.selectedAmount);
            },
            child: Container(
              height: 50,
              width: 90,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: amountList[index] == widget.selectedAmount
                      ? context.color.primary
                      : context.color.onPrimaryContainer,
                  width: amountList[index] == widget.selectedAmount ? 4 : 2,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text("${amountList[index]}"),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => 8.pw,
      ),
    );
  }
}
