import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gateflow/models/devices_entity.dart';
import 'package:gateflow/screens/bind/components/edit_dialog.dart';
import 'package:gateflow/utils/http.dart';
import '../../../constants.dart';
import '../../controllers/MenuController.dart';
import '../../responsive.dart';
import 'package:provider/provider.dart';

class BindScreen extends StatefulWidget {
  final List<DevicesData> devices = List.empty(growable: true);

  @override
  State<BindScreen> createState() => _BindScreen();
}

class _BindScreen extends State<BindScreen> {
  void _getDevices() async {
    try {
      var response = await HttpUtils.post("/devices/list", "");
      setState(() {
        var newData = DevicesEntity.fromJson(response).data!;
        widget.devices.clear();
        widget.devices.addAll(newData);
      });
    } catch (e) {
      print(e);
    }
  }

  void onRefresh() {
    Future.delayed(const Duration(milliseconds: 200), () {
      _getDevices();
    });
  }

  // 弹出对话框
  Future<bool?> _showDeleteConfirmDialog() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: secondaryColor,
          title: const Text("提示"),
          content: const Text("您确定要删除当前设备吗?"),
          actions: <Widget>[
            TextButton(
              child: const Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            TextButton(
              child: const Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteDevices(int? dId) async {
    try {
      var response = await HttpUtils.post("/devices/delete", dId);
      print(response);
    } catch (e) {
      print(e);
    }
    _getDevices();
  }

  @override
  void initState() {
    super.initState();
    _getDevices();
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  Widget build(BuildContext context) {
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
            "设备绑定",
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
    );
    print("getDevices");
    var card = Card(
        child: Padding(
      padding: EdgeInsets.all(defaultPadding),
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
            icon: const Icon(Icons.add),
            label: const Text("添加设备"),
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
      ),
    ));
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: defaultPaddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            card,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Text("${info.tag}"),
                ),
              ],
            ),
            placeholder: true),
        DataCell(Text("${info.number}"), placeholder: true),
        DataCell(Text("${info.ip}"), placeholder: true),
        DataCell(Text("${info.version}"), placeholder: true),
        DataCell(Text("${info.status}"), placeholder: true),
        DataCell(
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.blue,
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
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () async {
                    bool? delete = await _showDeleteConfirmDialog();
                    if (delete == null) {
                      print("取消删除");
                    } else {
                      _deleteDevices(info.id);
                    }
                  },
                ),
              ],
            ),
            placeholder: true),
      ],
    );
  }
}
