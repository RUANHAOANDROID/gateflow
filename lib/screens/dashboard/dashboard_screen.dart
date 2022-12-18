import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gateflow/models/HardwareInfo.dart';
import 'package:gateflow/models/hardware_entity.dart';
import 'package:gateflow/models/ws_hds_entity.dart';

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
  @override
  State<StatefulWidget> createState() => _DashboardScreen();
  final List<HardwareInfo> hardwares = hardwareInfoList;
}

class _DashboardScreen extends State<MyDashboardScreen> {
  //final channel = HtmlWebSocketChannel.connect('ws://localhost:8888/ws/flow');
  final channel = IOWebSocketChannel.connect('ws://localhost:8888/ws/flow');

  @override
  void initState() {
    //widget.channel.stream.listen((message) {})
    super.initState();
    //_sendMsg("ECTH A A  A  A a A");
    print("Send MSG");
    // channel.stream.listen((event) {
    //   print(event);
    // });
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  void _sendMsg(String msg) {
    channel.sink.add(msg);
  }

  @override
  Widget build(BuildContext context) {
    var singleChildScrollView = SingleChildScrollView(
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
                    RecentFiles(),
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
    HardwareEntity hd;
    return SafeArea(
      child: StreamBuilder(
        stream: channel.stream,
        builder: (context, snapshot) {
          //网络不通会走到这
          if (snapshot.hasError) {
            print(snapshot);
          } else if (snapshot.hasData) {
            var body = snapshot.data.toString();
            handleWsMsg(body);
          }
          return singleChildScrollView;
        },
      ),
    );
  }

  void handleWsMsg(String body)  {
    print(body);
    var jsonMap = json.decode(body);
    var type = jsonMap['type'];
    var data = jsonMap['data'];
    if (type == 4) {
      handleHardware(type, data);
    }
  }

  void handleHardware(int type, data) {
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
}
