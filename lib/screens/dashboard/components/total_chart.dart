import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gateflow/models/passed_total_entity.dart';
import 'package:gateflow/theme/styles.dart';

import '../../../constants.dart';

//https://github.com/imaNNeoFighT/fl_chart/blob/master/example/lib/pie_chart/samples/pie_chart_sample2.dart
//https://raw.githubusercontent.com/imaNNeoFighT/fl_chart/master/repo_files/images/pie_chart/pie_chart_sample_2.gif
class Chart extends StatefulWidget {
  final PassedTotalEntity entity;

  @override
  State<StatefulWidget> createState() => _Chart();

  Chart({Key? key, required this.entity}) : super(key: key);
}

class _Chart extends State<Chart> {
  int touchedIndex = -1;

  List<PieChartSectionData> _pieChartData(
      List<PassedTotalDeviceTotals> deviceTotals) {
    List<PieChartSectionData> data = List.empty(growable: true);
    deviceTotals.asMap().forEach((index, value) {
      final isTouched = index == touchedIndex;
      final fontSize = isTouched ? 16.0 : 14.0;
      final radius = isTouched ? 55.0 : 50.0;
      var pieChart = PieChartSectionData(
        color: Styles.colors[index],
        value: deviceTotals[index].proportion,
        title: "${deviceTotals[index].proportion!.toStringAsFixed(2)}%",
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
      );
      data.add(pieChart);
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    var sum = 0;
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              }),
              sectionsSpace: 0,
              centerSpaceRadius: 50,
              //startDegreeOffset: -90,
              sections: _pieChartData(widget.entity.deviceTotals!),
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: defaultPadding),
                Text(
                  "${widget.entity.sum}",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 0.5,
                      ),
                ),
                Text("共")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
