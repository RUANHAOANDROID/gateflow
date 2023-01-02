import 'dart:collection';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gateflow/models/events_entity.dart';

import '../../../constants.dart';
import '../../../models/linked_events.dart';

//事件日志
class EventLogs extends StatefulWidget {
  //final LinkedList<LinkedListEntryImpl> eventLogs;
  final LinkedList<LinkedListEntryImpl> eventLogs;
  EventLogs({
    Key? key,
    required this.eventLogs,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EventLogs();
}

class _EventLogs extends State<EventLogs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "事件面板",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: const [
                DataColumn(
                  label: Text("事件"),
                ),
                DataColumn(
                  label: Text("日期"),
                ),
                DataColumn(
                  label: Text("内容"),
                ),
              ],
              rows: List.generate(
                widget.eventLogs.length,
                (index) =>
                    recentFileDataRow(widget.eventLogs.elementAt(index).value),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(EventsEntity info) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            // SvgPicture.asset(
            //   fileInfo.icon!,
            //   height: 30,
            //   width: 30,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(info.tag!),
            ),
          ],
        ),
      ),
      DataCell(Text(info.time!)),
      DataCell(Text(info.content!)),
    ],
  );
}
