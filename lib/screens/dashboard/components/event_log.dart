import 'dart:collection';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gateflow/models/events_entity.dart';
import 'package:gateflow/wiidget/mytoast.dart';

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
    _today() {
      DateTime now = DateTime.now();
      return now.toString().split(" ")[0];
    }

    var titleString2 = "事件面板[${_today()}]";
    var title = Text(
      titleString2,
      style: Theme.of(context).textTheme.subtitle1,
    );
    var titleColumn = Row(
      children: [
        title,
        Expanded(
          child: Text(""),
        ),
        TextButton.icon(
          icon: Icon(Icons.read_more),
          label: Text("更多事件"),
          onPressed: () {},
        )
      ],
    );
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleColumn,
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: const [
                DataColumn2(
                  label: Text("时间"),
                ),
                DataColumn2(
                  label: Text("点位"),
                ),
                DataColumn2(
                  label: Text("事件"),
                ),
                DataColumn2(
                  label: Text("内容"),
                ),
              ],
              rows: List.generate(
                widget.eventLogs.length,
                (index) =>
                    recentFileDataRow(widget.eventLogs.elementAt(index).value),
              ),
            ),
          )
        ],
      ),
    );
  }

  DataRow recentFileDataRow(EventsEntity info) {
    return DataRow(
      cells: [
        // DataCell(
        //   Row(
        //     children: [
        //       // SvgPicture.asset(
        //       //   fileInfo.icon!,
        //       //   height: 30,
        //       //   width: 30,
        //       // ),
        //       Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        //         child: Text(info.tag!),
        //       ),
        //     ],
        //   ),
        // ),
        DataCell(Text(info.time!.split(" ")[1]), placeholder: true),
        DataCell(Text(info.deviceName!), placeholder: true),
        DataCell(Text(info.tag!), placeholder: true),
        DataCell(
            Text(
              info.content!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            placeholder: true, onTap: () {
          showDialog(
            context: context,
            //barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return Dialog(
                backgroundColor: secondaryColor,
                child: Container(
                  width: 600,
                  height: 300,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                  color: bgColor,
                  child: SelectableText (info.content!),
                ),
              );
            },
          );
          //FToast().init(context).showToast(child: Text(info.content!),toastDuration:Duration(seconds: 5) );
        }),
      ],
    );
  }
}
