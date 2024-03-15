import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_nutri_app/utils/extensions/color_extensions.dart';
import 'package:my_nutri_app/utils/resources/app_colors.dart';

class CustomBarChart extends StatefulWidget {
  CustomBarChart({super.key});

  List<Color> get availableColors => const <Color>[
    AppColors.contentColorPurple,
    AppColors.contentColorYellow,
    AppColors.contentColorBlue,
    AppColors.contentColorOrange,
    AppColors.contentColorPink,
    AppColors.contentColorRed,
  ];

  final Color barBackgroundColor =
  AppColors.contentColorWhite.darken().withOpacity(0.3);
  final Color barColor = AppColors.contentColorWhite;
  final Color touchedBarColor = AppColors.nutriRed;

  @override
  State<StatefulWidget> createState() => CustomBarChartState();
}

class CustomBarChartState extends State<CustomBarChart> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 30, 16, 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: BarChart(
                    // isPlaying ? randomData() :
                    mainBarData(),
                    swapAnimationDuration: animDuration,
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 12,
              // ),
            ],
          ),
        ),
      ],
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color? barColor,
        double width = 16,
        List<int> showTooltips = const [],
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
              ? BorderSide(color: widget.touchedBarColor.darken(80))
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: AppColors.contentColorWhite,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 5, isTouched: i == touchedIndex,barColor: Colors.grey);
      case 1:
        return makeGroupData(1, 13.5, isTouched: i == touchedIndex,barColor: Colors.grey);
      case 2:
        return makeGroupData(2, 9.5, isTouched: i == touchedIndex,barColor: Colors.grey);
      case 3:
        return makeGroupData(3, 8.5, isTouched: i == touchedIndex,barColor: Colors.grey);
      case 4:
        return makeGroupData(4, 14, isTouched: i == touchedIndex,barColor: AppColors.nutriGreen);
      case 5:
        return makeGroupData(5, 3, isTouched: i == touchedIndex,barColor: Colors.grey);
      case 6:
        return makeGroupData(6, 11.5, isTouched: i == touchedIndex, barColor: Colors.grey);
      default:
        return throw Error();
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.black,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = 'Monday';
                break;
              case 1:
                weekDay = 'Tuesday';
                break;
              case 2:
                weekDay = 'Wednesday';
                break;
              case 3:
                weekDay = 'Thursday';
                break;
              case 4:
                weekDay = 'Friday';
                break;
              case 5:
                weekDay = 'Saturday';
                break;
              case 6:
                weekDay = 'Sunday';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: TextStyle(
                    color: AppColors.nutriGreenDark,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
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
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('MO', style: style);
        break;
      case 1:
        text = const Text('TU', style: style);
        break;
      case 2:
        text = const Text('WE', style: style);
        break;
      case 3:
        text = const Text('TH', style: style);
        break;
      case 4:
        text = const Text('FR', style: style);
        break;
      case 5:
        text = const Text('SA', style: style);
        break;
      case 6:
        text = const Text('SU', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  // BarChartData randomData() {
  //   return BarChartData(
  //     barTouchData: BarTouchData(
  //       enabled: false,
  //     ),
  //     titlesData: FlTitlesData(
  //       show: true,
  //       bottomTitles: AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: true,
  //           getTitlesWidget: getTitles,
  //           reservedSize: 38,
  //         ),
  //       ),
  //       leftTitles: const AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: false,
  //         ),
  //       ),
  //       topTitles: const AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: false,
  //         ),
  //       ),
  //       rightTitles: const AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: false,
  //         ),
  //       ),
  //     ),
  //     borderData: FlBorderData(
  //       show: false,
  //     ),
  //     barGroups: List.generate(7, (i) {
  //       switch (i) {
  //         case 0:
  //           return makeGroupData(
  //             0,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         case 1:
  //           return makeGroupData(
  //             1,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         case 2:
  //           return makeGroupData(
  //             2,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         case 3:
  //           return makeGroupData(
  //             3,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         case 4:
  //           return makeGroupData(
  //             4,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         case 5:
  //           return makeGroupData(
  //             5,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         case 6:
  //           return makeGroupData(
  //             6,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         default:
  //           return throw Error();
  //       }
  //     }),
  //     gridData: const FlGridData(show: false),
  //   );
  // }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}