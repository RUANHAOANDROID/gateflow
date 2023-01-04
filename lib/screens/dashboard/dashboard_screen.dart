import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gateflow/models/HardwareInfo.dart';
import 'package:gateflow/models/devices_entity.dart';
import 'package:gateflow/models/events_entity.dart';
import 'package:gateflow/models/hardware_entity.dart';
import 'package:gateflow/models/linked_events.dart';
import 'package:gateflow/models/passed_total_entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

//import 'package:web_socket_channel/html.dart';
import '../../../constants.dart';
import '../../../responsive.dart';
import 'components/header.dart';
import 'components/hardware_list.dart';
import 'components/event_log.dart';
import 'components/total_details.dart';

//import 'package:web_socket_channel/io.dart';
//import 'package:web_socket_channel/custom_status.dart' as status;

class DashboardScreen extends StatefulWidget {
  final List<HardwareInfo> hardwares = hardwareInfoList;
  final int logMaxCount = 10;

  //final List<EventsEntity> eventLogs = List.empty(growable: true);
  final LinkedList<LinkedListEntryImpl<EventsEntity>> eventLogs =
      LinkedList<LinkedListEntryImpl<EventsEntity>>();
  final List<DevicesData> devices = List.empty(growable: true);
  PassedTotalEntity passedTotalEntity =
      PassedTotalEntity.create(0, List.empty(growable: true));

  @override
  State<StatefulWidget> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen> {
  //final _channel = HtmlWebSocketChannel.connect('ws://localhost:8888/ws/flow');

  final _channel = WebSocketChannel.connect(Uri.parse('ws://localhost:8888/ws/flow'));

  //获取面板信息
  void getInfo() {
    _sendMsg("ComeOn");
  }

  @override
  void initState() {
    super.initState();
    _channel.stream.listen((event) {
      print("ws channel listen = $event");
      handleWsMsg(event);
    }, onDone: () {
      print("ws channel listen onDone");
    }, onError: (err) {
      print("ws channel listen onError $err");
    });
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  void _sendMsg(String msg) {
    _channel.sink.add(msg);
    print("_sendMsg = $msg");
  }

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                const Header(),
                const SizedBox(height: defaultPadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          HardwareList(
                            hardwares: widget.hardwares,
                          ),
                          const SizedBox(height: defaultPadding),
                          EventLogs(eventLogs: widget.eventLogs),
                          if (Responsive.isMobile(context))
                            const SizedBox(height: defaultPadding),
                          if (Responsive.isMobile(context))
                            TotalDetails(entity: widget.passedTotalEntity),
                        ],
                      ),
                    ),
                    if (!Responsive.isMobile(context))
                      const SizedBox(width: defaultPadding),
                    // On Mobile means if the screen is less than 850 we dont want to show it
                    if (!Responsive.isMobile(context))
                      Expanded(
                        flex: 2,
                        child: TotalDetails(entity: widget.passedTotalEntity),
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

  void handleWsMsg(String body) async {
    const TYPE_DEVICES = 1; //设备
    const TYPE_LOG = 2; //日志
    const TYPE_EVENT = 3; //事件
    const TYPE_HARDWARES = 4; // 硬件信息
    const TYPE_TOTAL = 6; // 共计人数
    var jsonMap = json.decode(body);
    var type = jsonMap['type'];
    var data = jsonMap['data'];
    print("handleWsMsg type= ${type} data = ${data}");
    if (type == TYPE_HARDWARES) {
      handleHardware(data);
    } else if (type == TYPE_EVENT) {
      handleEventLog(data);
    } else if (type == TYPE_DEVICES) {
    } else if (type == TYPE_TOTAL) {
      handleDevicesTotal(data);
    }
    setState(() {});
  }

  //硬件
  void handleHardware(data) {
    print("handleHardware 处理当前硬件消息");
    for (dynamic data in data) {
      HardwareEntity hd = HardwareEntity.fromJson(data);

      if (hd.name == "Disk") {
        var used = double.parse(hd.used!) / 1024 / 1024 / 1024;
        var total = double.parse(hd.total!) / 1024 / 1024 / 1024;
        var percentage = double.parse(hd.proportion!);
        widget.hardwares[0].used = "${used.toStringAsFixed(2)}GB";
        widget.hardwares[0].total = "${total.toStringAsFixed(2)}GB";
        widget.hardwares[0].percentage = percentage.toInt();
      }
      if (hd.name == "CPU") {
        var total = double.parse(hd.total!) / 1000;
        var percentage = double.parse(hd.proportion!);
        widget.hardwares[1].used = "${hd.used}核心";
        widget.hardwares[1].total = "${total.toStringAsFixed(2)}Mhz";
        widget.hardwares[1].percentage = percentage.toInt();
      }
      if (hd.name == "Memory") {
        var used = double.parse(hd.used!) / 1024 / 1024 / 1024;
        var total = double.parse(hd.total!) / 1024 / 1024 / 1024;
        var percentage = double.parse(hd.proportion!);
        widget.hardwares[2].used = "${used.toStringAsFixed(2)}GB";
        widget.hardwares[2].total = "${total.toStringAsFixed(2)}GB";
        widget.hardwares[2].percentage = percentage.toInt();
      }
      if (hd.name == "LOGS") {
        var used = double.parse(hd.used!) / 1024 / 1024 / 1024;
        var total = double.parse(hd.total!) / 1024 / 1024 / 1024;
        var percentage = double.parse(hd.proportion!) * 100;
        widget.hardwares[3].used = "${used.toStringAsFixed(2)}GB";
        widget.hardwares[3].total = "${total.toStringAsFixed(2)}GB";
        widget.hardwares[3].percentage = percentage.toInt();
      }
    }
  }

  //事件
  void handleEventLog(data) {
    print("handleEventLog 处理事件消息");
    for (dynamic item in data) {
      EventsEntity event = EventsEntity.fromJson(item);
      var entry = LinkedListEntryImpl(event);
      var exist = _exist(entry);
      if (exist) {
        continue;
      }
      if (widget.eventLogs.length > widget.logMaxCount) {
        widget.eventLogs.remove(widget.eventLogs.last);
      }
      widget.eventLogs.addFirst(entry);
    }
  }

  bool _exist(LinkedListEntryImpl<EventsEntity> entry) {
    bool _exist = false;
    for (LinkedListEntryImpl oldItem in widget.eventLogs) {
      if (entry.value.id == oldItem.value.id) {
        _exist = true;
      }
    }
    return _exist;
  }

  void handleDevicesTotal(data) {
    print("handleDevicesTotal 处理统计消息");
    widget.passedTotalEntity = PassedTotalEntity.fromJson(data);
  }
}
