// ignore_for_file: avoid_redundant_argument_values

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BarChartWidget extends StatefulWidget {
  const BarChartWidget({super.key});

  Color get barBackgroundColor => const Color(0x5405226F);
  Color get barColor => const Color(0xFFE0E0E0);
  Color get touchedBarColor =>  const Color(0xFF4475F6);


  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final customWidth = MediaQuery
        .of(context)
        .size
        .width;


    return Stack(
      children: [
        Container(
          width: customWidth,
          height: 210.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              end: Alignment(0.96, -0.29),
              begin: Alignment(-0.96, 0.29),
              colors: [Color(0xFF4475F6), Color(0xFF07236B)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
            child: BarChart(
              mainBarData(),
            ),
          ),
        ),
      ],
    );
  }

  BarChartGroupData makeGroupData(int x,
      double y, {
        bool isTouched = false,
        Color? barColor,
        double width = 6,
      }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: widget.touchedBarColor)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 12,
            color: widget.barBackgroundColor,
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> showingGroups() =>
      List.generate(12, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 0.5, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 6, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 8, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 2, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 8, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 11, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 4, isTouched: i == touchedIndex);
          case 7:
            return makeGroupData(7, 2, isTouched: i == touchedIndex);
          case 8:
            return makeGroupData(8, 6, isTouched: i == touchedIndex);
          case 9:
            return makeGroupData(9, 3, isTouched: i == touchedIndex);
          case 10:
            return makeGroupData(10, 6, isTouched: i == touchedIndex);
          case 11:
            return makeGroupData(11, 10, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontSize: 8.11,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w300,
      height: 0,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('00:00 \n02:00', style: style);
      case 1:
        text = const Text('02:00 \n04:00', style: style);
      case 2:
        text = const Text('04:00 \n06:00', style: style);
      case 3:
        text = const Text('06:00 \n08:00', style: style);
      case 4:
        text = const Text('08:00 \n10:00', style: style);
      case 5:
        text = const Text('10:00 \n12:00', style: style);
      case 6:
        text = const Text('12:00 \n14:00', style: style);
      case 7:
        text = const Text('14:00 \n16:00', style: style);
      case 8:
        text = const Text('16:00 \n18:00', style: style);
      case 9:
        text = const Text('18:00 \n20:00', style: style);
      case 10:
        text = const Text('20:00 \n22:00', style: style);
      case 11:
        text = const Text('22:00 \n24:00', style: style);
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }
}
