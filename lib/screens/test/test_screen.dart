import 'dart:ui';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gateflow/controllers/MenuItemController.dart';
import 'package:gateflow/models/devices_entity.dart';
import 'package:gateflow/net/http.dart';
import 'package:gateflow/utils/http.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class TestScreen extends StatefulWidget {
  List<DevicesData> devices = List.empty(growable: true);

  TestScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TestScreen();
}

class _TestScreen extends State<TestScreen> {
  void getDevices() async {
    try {
      var devices = await HttpManager.devicesList();
      setState(() {
        widget.devices = devices;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getDevices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "设备列表 ",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: window.physicalSize.height*0.58,
          width: double.infinity,
          child: DataTable2(
            columnSpacing: defaultPadding,
            minWidth: 600,
            columns: const [
              DataColumn(
                label: Text("点位"),
              ),
              DataColumn(
                label: Text("设备号"),
              ),
              DataColumn(
                label: Text("IP"),
              ),
              DataColumn(
                label: Text("版本"),
              ),
              DataColumn(
                label: Text("状态"),
              ),
              DataColumn(
                label: Text("操作"),
              ),
            ],
            rows: List.generate(
              widget.devices.length,
              (index) => devicesDataRow(widget.devices[index]),
            ),
          ),
        ),
      ],
    );
    var title = Padding(
      padding: const EdgeInsets.only(
          left: defaultPadding / 2,
          top: defaultPadding / 2,
          bottom: defaultPadding),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: context.read<MenuItemController>().controlMenu,
            ),
          Text(
            "设备调试",
            style: Theme.of(context).textTheme.headlineSmall,
          )
        ],
      ),
    );
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: defaultPaddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            Card(
              color: Theme.of(context).cardTheme.color,
              child: Padding(
                padding: defaultPaddingAll,
                child: column,
              ),
            )
            //Card()container,
          ],
        ),
      ),
    );
  }
}

DataRow devicesDataRow(DevicesData info) {
  void _openGateTest(DevicesData info) async {
    var map = {'sn': info.sn, 'ip': info.ip};
    HttpUtils.post("/devices/openGateTest", map);
  }

  return DataRow(
    cells: [
      DataCell(
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text("${info.tag}"),
              ),
            ],
          ),
          placeholder: true),
      DataCell(Text(info.sn!), placeholder: true),
      DataCell(Text(info.ip!), placeholder: true),
      DataCell(Text(info.version!), placeholder: true),
      DataCell(Text(info.status=="0"?"离线":"在线"), placeholder: true),
      DataCell(
          Row(
            children: [
              // ElevatedButton(
              //   onPressed: () {
              //     _openGateTest(info);
              //   },
              //   child: const Text(
              //     '开闸调试',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              IconButton(
                icon: const Icon(
                  Icons.open_in_browser,
                  color: Colors.blue,
                ),
                onPressed: ()  {
                  _openGateTest(info);
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.blue,
                ),
                onPressed: () async {
                  final Uri url = Uri.parse('http://192.168.1.141:8585');
                  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                    throw '无法打开 $url';
                  }
                },
              ),
            ],
          ),
          placeholder: true),
    ],
  );

}
