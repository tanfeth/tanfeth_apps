import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';


class MonthsWidget extends StatefulWidget {
  final Function(DateTime) callBack;

  MonthsWidget({required this.callBack});

  @override
  State<StatefulWidget> createState() {
    return _MonthsWidgetState();
  }
}

class _MonthsWidgetState extends State<MonthsWidget> {
  List<DateTime> months = [];
  DateTime? selectedMonth;
   late FixedExtentScrollController controller;

  Timer? _debounce;
  int _debounceTime = 500;

  @override
  void initState() {
    months = returnSevenMonths();
    selectedMonth =
        months.firstWhere((element) => element.month == DateTime.now().month&&
            element.year == DateTime.now().year) ;
    controller = FixedExtentScrollController(
        initialItem: months.indexOf(selectedMonth!));
    widget.callBack(selectedMonth ?? DateTime.now());
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: double.infinity,
          child: RotatedBox(
            quarterTurns: 3,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 150,
              squeeze: 1,
              useMagnifier: true,
              controller: controller,
              physics: FixedExtentScrollPhysics(),
              magnification: 1,
              onSelectedItemChanged: (index) {
                _onMonthsChanged(index);
              },
              childDelegate: ListWheelChildBuilderDelegate(
                  childCount: months.length,
                  builder: (BuildContext context, int index) {
                    return RotatedBox(
                      quarterTurns: -3,
                      child: Container(
                        width: 200,
                        child: Text(
                          DateFormat('MMMM').format(months[index])+'\n'+
                          '${months[index].year}',
                          style: selectedMonth == months[index]
                              ? Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary)
                              : Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Theme.of(context).colorScheme.primary),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ],
    );

  }


  void _onMonthsChanged(int index) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: _debounceTime), () {
      widget.callBack(months[index]);
      selectedMonth = months[index];
      setState(() {});
    });
  }

}
