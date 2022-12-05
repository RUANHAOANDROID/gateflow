import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gateflow/models/DeviceInfo.dart';

import '../../../constants.dart';
import '../../responsive.dart';

class BindScreen extends StatelessWidget {
  const BindScreen({
    Key? key,
  }) : super(key: key);

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
          ElevatedButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5,
                vertical:
                    defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
              ),
            ),
            onPressed: () {},
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
                  label: Text("ID"),
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
                demoDevices.length,
                (index) => devicesDataRow(demoDevices[index]),
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(bottom: defaultPadding),
                child: Text(
                  "设备调试",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              container
            ])));
  }
}

DataRow devicesDataRow(DeviceInfo info) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(info.flowId!),
            ),
          ],
        ),
      ),
      DataCell(Text(info.dId!.toString())),
      DataCell(Text(info.ip!.toString())),
      DataCell(Text(info.version!.toString())),
      DataCell(Text(info.status!.toString())),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: primaryColor,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              )),
        ],
      )),
    ],
  );
}
