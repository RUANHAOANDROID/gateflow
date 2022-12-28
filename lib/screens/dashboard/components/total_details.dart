import 'package:flutter/material.dart';
import 'package:gateflow/theme/styles.dart';

import '../../../constants.dart';
import '../../../models/passed_total_entity.dart';
import 'total_chart.dart';
import 'total_info_card.dart';

//右侧统计
class TotalDetails extends StatefulWidget {
  final PassedTotalEntity entity;

  TotalDetails({Key? key, required this.entity}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TotalDetails();
}

class _TotalDetails extends State<TotalDetails> {
  @override
  Widget build(BuildContext context) {
    var sum = 0;
    if (null != widget.entity.sum) {
      sum = widget.entity.sum!;
    }

    var deviceTotals = List.empty(growable: true);
    if (null != widget.entity.deviceTotals) {
      deviceTotals = widget.entity.deviceTotals!;
    }
    List<Widget> widgets() {
      List<Widget> widgets = List.empty(growable: true);
      widgets.add(Text(
        "人次总览",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ));

      widgets.add(SizedBox(height: defaultPadding));
      widgets.add(Chart(
        entity: widget.entity,
      ));

      if (deviceTotals.isNotEmpty) {
        deviceTotals.asMap().forEach((index, value) {
          PassedTotalDeviceTotals item = deviceTotals[index];
          var totalInfoCard = TotalInfoCard(
            svgSrc: "assets/icons/passed.svg",
            svgColor: Styles.colors[index],
            title: item.deviceTag!,
            passedCount: item.deviceSum.toString(),
            numOfFiles: "在线",
          );
          //totalInfoCards.add(totalInfoCard);
          widgets.add(totalInfoCard);
        });
      }
      return widgets; // all widget added now retrun the list here
    }

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets(),
      ),
    );
  }
}
