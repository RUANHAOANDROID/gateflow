import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gateflow/models/devices_entity.dart';
import 'package:gateflow/net/http.dart';
import 'package:gateflow/utils/http.dart';

import '../../../constants.dart';
import '../../../models/EventLog.dart';
import '../../responsive.dart';

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
    var container = Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.devices,
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: "  设备列表 ",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("点位"),
                ),
                DataColumn(
                  label: Text("设备编号"),
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
      ),
    );
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: defaultPadding),
              child: Text(
                "设备调试",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            container,
          ],
        ),
      ),
    );
  }
}

DataRow devicesDataRow(DevicesData info) {
  void _openGateTest(DevicesData info) async {
    var map = {'number': info.number, 'ip': info.ip};
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
      ),
      DataCell(Text(info.number!)),
      DataCell(Text(info.ip!)),
      DataCell(Text(info.version!)),
      DataCell(Text(info.status!)),
      DataCell(Row(
        children: [
          ElevatedButton(
            onPressed: () {
              _openGateTest(info);
            },
            child: Text(
              '开闸调试',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )),
    ],
  );
}
