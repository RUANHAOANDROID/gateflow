import 'dart:collection';
import 'dart:ui';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gateflow/models/events_entity.dart';
import 'package:gateflow/screens/dashboard/components/paginated_log.dart';
import 'package:gateflow/theme/theme.dart';
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
    // _today() {
    //   DateTime now = DateTime.now();
    //   return now.toString().split(" ")[0];
    // }
    //var titleString2 = "事件面板[${_today()}]";
    var titleString2 = "事件面板";
    var title = Text(
      titleString2,
      style: Theme.of(context).textTheme.titleMedium,
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
          onPressed: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: PaginatedDataTablePage(),
                );
              },
            );
          },
        )
      ],
    );
    var dataTable2 = DataTable2(
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
                (index) => recentFileDataRow(
                    widget.eventLogs.elementAt(index).value, index),
              ),
            );
    var container = Container(
      padding: defaultPaddingAll,
      // decoration: BoxDecoration(
      //   color: Theme.of(context).cardColor,
      //   borderRadius: BorderRadius.all(Radius.circular(10)),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleColumn,
          SizedBox(
            height: window.physicalSize.height*0.4,
            width: double.infinity,
            child: dataTable2,
          )
        ],
      ),
    );
    return Card(
        elevation: 5.0, //设置阴影
        color: Theme.of(context).canvasColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))), //设置圆角
        child: container);
  }

  DataRow recentFileDataRow(EventsEntity info, index) {
    return DataRow(
      cells: [
        DataCell(Text(info.time!.split(" ")[1]), placeholder: true),
        DataCell(Text(info.deviceName!), placeholder: true),
        DataCell(Text(info.tag!), placeholder: true),
        DataCell(
          Text(
            info.content!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          placeholder: true,
          onTap: () {
            _showLogContextInfo(info);
          },
        ),
      ],
    );
  }

  void _showLogContextInfo(EventsEntity info) {
    showDialog(
      context: context,
      //barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: 600,
            height: 300,
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: SelectableText(info.content!),
          ),
        );
      },
    );
  }
}
