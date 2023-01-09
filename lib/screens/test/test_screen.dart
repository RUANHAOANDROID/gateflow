import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gateflow/controllers/MenuController.dart';
import 'package:gateflow/models/devices_entity.dart';
import 'package:gateflow/net/http.dart';
import 'package:gateflow/utils/http.dart';
import 'package:provider/provider.dart';

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
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(
          width: double.infinity,
          child: DataTable2(
            columnSpacing: defaultPadding,
            minWidth: 600,
            columns: const [
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
              onPressed: context.read<MenuController>().controlMenu,
            ),
          Text(
            "设备调试",
            style: Theme.of(context).textTheme.headline6,
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
              margin: EdgeInsets.only(left: defaultPadding / 2),
              child: Padding(
                padding: EdgeInsets.all(defaultPadding / 2),
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
          placeholder: true),
      DataCell(Text(info.number!), placeholder: true),
      DataCell(Text(info.ip!), placeholder: true),
      DataCell(Text(info.version!), placeholder: true),
      DataCell(Text(info.status!), placeholder: true),
      DataCell(
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  _openGateTest(info);
                },
                child: const Text(
                  '开闸调试',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          placeholder: true),
    ],
  );
}
