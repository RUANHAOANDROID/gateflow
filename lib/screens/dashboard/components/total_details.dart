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
    var deviceTotals = List.empty(growable: true);
    if (null != widget.entity.deviceTotals) {
      deviceTotals = widget.entity.deviceTotals!;
    }
    List<Widget> widgets() {
      List<Widget> widgets = List.empty(growable: true);
      widgets.add(const Text(
        "人次总览",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ));

      widgets.add(const SizedBox(height: defaultPadding));
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

    return Card(
      elevation: 5.0, //设置阴影
      color: Theme.of(context).canvasColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))), //设置圆角
      child: Padding(
        padding: defaultPaddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgets(),
        ),
      ),
    );
  }
}
