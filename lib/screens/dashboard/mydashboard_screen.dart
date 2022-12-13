import 'package:flutter/material.dart';
import 'package:gateflow/models/hardware_entity.dart';
import 'package:web_socket_channel/html.dart';
import '../../../constants.dart';
import '../../../responsive.dart';
import 'components/header.dart';
import 'components/my_fields.dart';
import 'components/recent_files.dart';
import 'components/storage_details.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class MyDashboardScreen extends StatefulWidget {
  final List<HardwareEntity> hardwares = [];
  @override
  State<StatefulWidget> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<MyDashboardScreen> {
  final channel = HtmlWebSocketChannel.connect('ws://localhost:8888/ws/flow');

  @override
  void initState() {
    //widget.channel.stream.listen((message) {})
    super.initState();
    _sendMsg("ECTH A A  A  A a A");
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
                    MyFiles(),
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
            print(snapshot.data);
          }
          return singleChildScrollView;
        },
      ),
    );
  }
}
