import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';


class Chart extends StatefulWidget {
  final List<String>title;
  final List<List<double>>values;
  final bool multivalued;
  
  
   const Chart({
    required this.title,
    required this.values,
    this.multivalued=false,
    Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  @override
  Widget build(BuildContext context) {
    return  BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        barGroups: barGroups,
        borderData: FlBorderData(show: false,),
        gridData:   FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
      ),
    );
  }



  BarTouchData get barTouchData => BarTouchData(
    enabled: false,
    touchTooltipData: BarTouchTooltipData(
      // getTooltipColor: Colors.transparent,
      tooltipPadding: EdgeInsets.zero,
      tooltipMargin: 0,
      getTooltipItem: (BarChartGroupData group, int groupIndex, BarChartRodData rod, int rodIndex,) {return BarTooltipItem("", const TextStyle(),);},
    ),
  );

  Widget getTitles(double value, TitleMeta meta) {
    return SideTitleWidget(
        axisSide:AxisSide.left,
        space:22,
        child: FittedBox(child:
        Text(
            widget.title[value.toInt()],
            style: Get.context!.text.titleMedium?.copyWith(
                color: Get.context!.color.surfaceContainerHighest
            ),
            textAlign: TextAlign.start
        ),
        )
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTitlesWidget: getTitles,
      ),
    ),
    leftTitles:   AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles:   AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    rightTitles:   AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
  );

  List<BarChartGroupData> get barGroups => List.generate(widget.values.length, (index1) => BarChartGroupData(
    x: index1,
    barRods: List.generate(widget.values[index1].length, (index2) =>  BarChartRodData(
      toY: widget.values[index1][index2].toDouble(),
      width: widget.multivalued?6:33,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(8),
          topRight: Radius.circular(8)),
      gradient:  LinearGradient(colors: [
        Get.context!.color.primary,
        Get.context!.color.primary.withOpacity(0.3),
      ],),
    ),),
    showingTooltipIndicators: [0],
  ),);



}
