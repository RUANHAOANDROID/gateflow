import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gateflow/models/HardwareInfo.dart';
import 'package:gateflow/models/devices_entity.dart';
import 'package:gateflow/models/events_entity.dart';
import 'package:gateflow/models/hardware_entity.dart';
import 'package:gateflow/models/linked_events.dart';
import 'package:gateflow/models/ws_hds_entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

//import 'package:web_socket_channel/html.dart';
import '../../../constants.dart';
import '../../../responsive.dart';
import 'components/header.dart';
import 'components/my_fields.dart';
import 'components/recent_files.dart';
import 'components/storage_details.dart';

//import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
//import 'package:web_socket_channel/status.dart' as status;

class MyDashboardScreen extends StatefulWidget {
  final List<HardwareInfo> hardwares = hardwareInfoList;

  //final List<EventsEntity> eventLogs = List.empty(growable: true);
  final LinkedList<LinkedListEntryImpl<EventsEntity>> eventLogs =
      LinkedList<LinkedListEntryImpl<EventsEntity>>();
  final List<DevicesData> devices = List.empty(growable: true);

  @override
  State<StatefulWidget> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<MyDashboardScreen> {
  //final channel = HtmlWebSocketChannel.connect('ws://localhost:8888/ws/flow');
  final _channel =
      WebSocketChannel.connect(Uri.parse('ws://localhost:8888/ws'));

  @override
  void initState() {
    super.initState();
    _channel.stream.listen((message) {
      handleWsMsg(message);
    });
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  void _sendMsg(String msg) {
    _channel.sink.add(msg);
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    return SafeArea(
      child: StreamBuilder(
        //stream: _channel.stream,
        builder: (context, snapshot) {
          //网络不通会走到这
          if (snapshot.hasError) {
            print("hasError");
            print(snapshot);
          } else if (snapshot.hasData) {
            var body = snapshot.data.toString();
            print(body);
            handleWsMsg(body);
          }
          return SingleChildScrollView(
            primary: false,
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                Header(),
                SizedBox(height: defaultPadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          MyFiles(
                            hardwares: widget.hardwares,
                          ),
                          SizedBox(height: defaultPadding),
                          RecentFiles(eventLogs: widget.eventLogs),
                          if (Responsive.isMobile(context))
                            SizedBox(height: defaultPadding),
                          if (Responsive.isMobile(context)) StarageDetails(),
                        ],
                      ),
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(width: defaultPadding),
                    // On Mobile means if the screen is less than 850 we dont want to show it
                    if (!Responsive.isMobile(context))
                      Expanded(
                        flex: 2,
                        child: StarageDetails(),
                      ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void handleWsMsg(String body) {
    print("handleWsMsg" + body);
    var jsonMap = json.decode(body);
    var type = jsonMap['type'];
    var data = jsonMap['data'];
    if (type == 4) {
      handleHardware(type, data);
    } else if (type == 3) {
      handleEventLog(data);
    } else if (type == 6) {
      handleDevicesTotal(data);
    }
  }

  //硬件
  void handleHardware(int type, data) {
    print("处理当前硬件消息");
    for (dynamic data in data) {
      HardwareEntity hd = HardwareEntity.fromJson(data);
      var percentage = double.parse(hd.proportion!) * 100;
      if (hd.name == "Disk") {
        widget.hardwares[0].used = hd.used;
        widget.hardwares[0].total = hd.total;
        widget.hardwares[0].percentage = percentage.toInt();
      }
      if (hd.name == "CPU") {
        widget.hardwares[1].used = hd.used;
        widget.hardwares[1].total = hd.total;
        widget.hardwares[1].percentage = percentage.toInt();
      }
      if (hd.name == "Memory") {
        widget.hardwares[2].used = hd.used;
        widget.hardwares[2].total = hd.total;
        widget.hardwares[2].percentage = percentage.toInt();
      }
      if (hd.name == "LOGS") {
        widget.hardwares.last.used = hd.used;
        widget.hardwares.last.total = hd.total;
        widget.hardwares.last.percentage = percentage.toInt();
      }
    }
  }

  //事件
  void handleEventLog(data) {
    print("处理事件消息" + data.toString());
    for (dynamic item in data) {
      EventsEntity event = EventsEntity.fromJson(item);
      if (widget.eventLogs.length > 5) {
        widget.eventLogs.remove(widget.eventLogs.last);
      }
      widget.eventLogs.addFirst(LinkedListEntryImpl(event));
    }
    setState(() {

    });
  }

  void handleDevicesTotal(data) {}
}
