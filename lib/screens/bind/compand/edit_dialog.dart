import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gateflow/models/devices_entity.dart';

import '../../../constants.dart';
import '../../../responsive.dart';
import '../../../utils/HttpUtils.dart';

class EditDialog extends StatefulWidget {
  final DevicesData? device;

  const EditDialog({Key? key, this.device}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _dialog();
}

class _dialog extends State<EditDialog> {
  void addDevice() async {
    try {
      var body = DevicesData();
      body.deviceId = c1.text;
      body.deviceNo = c2.text;
      body.deviceIp = c3.text;
      body.serialNumber = c4.text;
      body.deviceVersion = c5.text;
      print(body);
      HttpUtils.post("/devices/add", body);
    } catch (e) {}
  }

  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  TextEditingController c5 = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.device != null) {
      c1.text = widget.device?.id as String;
      c2.text = widget.device?.deviceId as String;
      c3.text = widget.device?.deviceNo as String;
      c4.text = widget.device?.serialNumber as String;
      c5.text = widget.device?.deviceVersion as String;
      c5.text = widget.device?.deviceStatus as String;
    }
  }

  @override
  void dispose() {
    c1.dispose();
    c2.dispose();
    c3.dispose();
    c4.dispose();
    c5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.blueGrey),
      borderRadius: const BorderRadius.all(Radius.circular(defaultPadding / 2)),
    );
    var singleChildScrollView = SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: TextFormField(
              controller: c1,
              decoration: InputDecoration(
                  border: outlineInputBorder,
                  labelText: '设备编号',
                  labelStyle: Theme.of(context).textTheme.subtitle2,
                  hintStyle: Theme.of(context).textTheme.subtitle2,
                  hintText: '请输设备编号'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: TextFormField(
              controller: c2,
              decoration: InputDecoration(
                  border: outlineInputBorder,
                  hintStyle: Theme.of(context).textTheme.subtitle2,
                  labelText: '设备IP',
                  labelStyle: Theme.of(context).textTheme.subtitle2,
                  hintText: '请输设备IP'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: TextFormField(
              controller: c3,
              decoration: InputDecoration(
                  border: outlineInputBorder,
                  labelText: '设备版本',
                  labelStyle: Theme.of(context).textTheme.subtitle2,
                  hintStyle: Theme.of(context).textTheme.subtitle2,
                  hintText: '请输设备编号'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: TextFormField(
              controller: c4,
              decoration: InputDecoration(
                  border: outlineInputBorder,
                  labelText: '设备序列号',
                  labelStyle: Theme.of(context).textTheme.subtitle2,
                  hintStyle: Theme.of(context).textTheme.subtitle2,
                  hintText: '请输设备序列号'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: TextFormField(
              onChanged: (value) {
                c5.text = value.toString();
              },
              controller: c5,
              decoration: InputDecoration(
                  border: outlineInputBorder,
                  labelStyle: Theme.of(context).textTheme.subtitle2,
                  hintStyle: Theme.of(context).textTheme.subtitle2,
                  labelText: '设备编号',
                  hintText: '请输设备编号'),
            ),
          ),
        ],
      ),
    );
    return AlertDialog(
      backgroundColor: secondaryColor,
      title: Text('添加设备'),
      content: Container(
        width: 450,
        child: singleChildScrollView,
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: defaultPadding * 1.5,
              vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
            ),
          ),
          child: const Text('取消'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: defaultPadding * 1.5,
              vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
            ),
          ),
          onPressed: () {
            addDevice();
            Navigator.of(context).pop();
          },
          child: Text("保存"),
        )
      ],
    );
  }
}
