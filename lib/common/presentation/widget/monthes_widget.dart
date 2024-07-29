import 'dart:async';

import 'package:api_controller/shared/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_controller/vm/langauge/langauge_vm.dart';


class MonthsWidget extends ConsumerStatefulWidget {
  final Function(DateTime) callBack;
  MonthsWidget({required this.callBack});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MonthsWidgetState();
  }
}

class _MonthsWidgetState extends ConsumerState<MonthsWidget> {
  List<DateTime> months = [];
  DateTime? selectedMonth;
  late FixedExtentScrollController controller;

  Timer? _debounce;
  final int _debounceTime = 500;

  @override
  void initState() {
    months = returnMonthsOfYear();
    selectedMonth = months.firstWhere((element) => element.month == DateTime.now().month&&
        element.year == DateTime.now().year) ;
    controller = FixedExtentScrollController(initialItem: months.indexOf(selectedMonth!));
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
              itemExtent: 100,
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
                    return GestureDetector(
                      onTap: ()=>{
                        controller.animateToItem(index, duration: Duration(milliseconds: _debounceTime), curve: Curves.easeInOut)
                      },
                      child: RotatedBox(
                        quarterTurns: -3,
                        child: Container(
                          margin: 6.toHorizontal,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: context.color.primaryContainer,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            DateFormat('MMMM',
                             ref.watch(languageProvider)).format(months[index])+'\n'+
                            '${months[index].year}',
                            style: selectedMonth == months[index]
                                ? context.text.titleMedium?.copyWith(
                                color:  context.color.primary)
                                :  context.text.titleSmall?.copyWith(
                                color: context.color.onPrimaryContainer),
                            textAlign: TextAlign.center,
                          ),
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
