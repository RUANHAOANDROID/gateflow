import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gateflow/models/devices_entity.dart';
import 'package:gateflow/screens/bind/compand/edit_dialog.dart';
import 'package:gateflow/utils/HttpUtils.dart';
import '../../../constants.dart';
import '../../responsive.dart';

class BindScreen extends StatefulWidget {
  @override
  State<BindScreen> createState() => _BindScreen();
}

class _BindScreen extends State<BindScreen> {
  List<DevicesData> devices = List.empty(growable: true);

  void getDevices() async {
    try {
      var response = await HttpUtils.post("/devices/list", "");
      setState(() {
        devices = DevicesEntity.fromJson(response).data!;
      });
    } catch (e) {
      print(e);
    }
  }

  void onRefresh() {
    print("onRefresh");
    getDevices();
    Future.delayed(Duration(seconds: 1), () {
      getDevices();
    });
  }

  void _deleteDevices(int? dId) async {
    try {
      var response = await HttpUtils.post("/devices/delete", dId);
      print(response);
    } catch (e) {
      print(e);
    }
    getDevices();
  }

  @override
  void initState() {
    super.initState();
    getDevices();
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  /**

      child: SingleChildScrollView(
      primary: false,
      padding: EdgeInsets.all(defaultPadding),
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
      padding: EdgeInsets.only(bottom: defaultPadding),
      child: Text(
      "设备调试",
      style: Theme.of(context).textTheme.headline6,
      ),
      ),
      content
      ])));
   */
  @override
  Widget build(BuildContext context) {
    print("getDevices");
    var container = Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5,
                vertical:
                    defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
              ),
            ),
            onPressed: () {
              showDialog<bool>(
                context: context,
                //barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return EditDialog(
                    device: null,
                  );
                },
              ).then((value) => onRefresh());
            },
            icon: Icon(Icons.add),
            label: Text("添加设备"),
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
                devices.length,
                (index) => devicesDataRow(devices[index]),
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
                "设备绑定",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            container,
          ],
        ),
      ),
    );
  }

  DataRow devicesDataRow(DevicesData info) {
    print(info);
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
        DataCell(Text("${info.number}")),
        DataCell(Text("${info.ip}")),
        DataCell(Text("${info.version}")),
        DataCell(Text("${info.status}")),
        DataCell(Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.edit,
                color: primaryColor,
              ),
              onPressed: () {
                showDialog<bool>(
                  context: context,
                  //barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return EditDialog(
                      device: info,
                    );
                  },
                ).then((value) => onRefresh());
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                _deleteDevices(info.id);
              },
            ),
          ],
        )),
      ],
    );
  }

  Future<Future<bool?>> showEditDialog(DevicesData? data) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return EditDialog(
          device: data,
        );
      },
    );
  }
}
