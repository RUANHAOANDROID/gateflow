import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gateflow/models/devices_entity.dart';

import '../../../constants.dart';
import '../../../responsive.dart';
import '../../../theme/theme.dart';
import '../../../utils/IpInputFormatter.dart';
import '../../../utils/http.dart';

class EditDialog extends StatefulWidget {
  final DevicesData? device;
  final _formKey = GlobalKey<FormState>();

  EditDialog({Key? key, this.device}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditDialog();
}

class _EditDialog extends State<EditDialog> {
  Future<bool> addDevice() async {
    try {
      var state = widget._formKey.currentState;
      if (state!.validate()) {
        var body = DevicesData();
        body.number = numberC.text;
        body.ip = ipC.text;
        body.sn = snC.text;
        body.version = versionC.text;
        body.tag = pointC.text;
        print(body);
        HttpUtils.post("/devices/add", body);
        setState(() {
          Navigator.of(context).pop(true);
        });
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateDevice() async {
    try {
      var state = widget._formKey.currentState;
      if (state!.validate()) {
        var body = DevicesData();
        body.id = widget.device!.id;
        body.number = numberC.text;
        body.ip = ipC.text;
        body.sn = snC.text;
        body.version = versionC.text;
        body.tag = pointC.text;
        print(body);
        var response = HttpUtils.post("/devices/update", body);
        setState(() {
          Navigator.of(context).pop(true);
        });
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  TextEditingController snC = TextEditingController();
  TextEditingController versionC = TextEditingController();
  TextEditingController ipC = TextEditingController();
  TextEditingController numberC = TextEditingController();
  TextEditingController pointC = TextEditingController();

  void checkParameter() {
    var state = widget._formKey.currentState;
    if (state!.validate()) {
    } else {}
  }

  @override
  void initState() {
    super.initState();
    if (widget.device != null) {
      numberC.text = widget.device?.number as String;
      ipC.text = widget.device?.ip as String;
      versionC.text = widget.device?.version as String;
      snC.text = widget.device?.sn as String;
      pointC.text = widget.device?.tag as String;
    }
  }

  @override
  void dispose() {
    numberC.dispose();
    ipC.dispose();
    versionC.dispose();
    snC.dispose();
    pointC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const paddingAll = EdgeInsets.all(defaultPadding / 2);
    var singleChildScrollView = SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          Padding(
            padding: paddingAll,
            child: TextFormField(
              controller: pointC,
              validator: (value) {
                return value!.trim().isNotEmpty ? null : "点位名称不能为空";
              },
              decoration: InputDecoration(
                  border: outlineInputBorder,
                  // labelStyle: formTextStyle(context),
                  // hintStyle: formTextStyle(context),
                  labelText: '设备点位',
                  hintText: '设备点位'),
            ),
          ),
          Padding(
            padding: paddingAll,
            child: TextFormField(
              controller: numberC,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '编号为空';
                }
                return null;
              },
              decoration: InputDecoration(
                  border: outlineInputBorder,
                  labelText: '设备编号',
                  // labelStyle: formTextStyle(context),
                  // hintStyle: formTextStyle(context),
                  hintText: '请输设备编号'),
            ),
          ),
          Padding(
            padding: paddingAll,
            child: TextFormField(
              inputFormatters: [
                MyInputFormatters.ipAddressInputFilter(),
                LengthLimitingTextInputFormatter(15),
                IpAddressInputFormatter()
              ],
              controller: ipC,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'IP为空';
                }
                return null;
              },
              decoration: InputDecoration(
                  border: outlineInputBorder,
                  // hintStyle: formTextStyle(context),
                  labelText: '设备IP',
                  // labelStyle: formTextStyle(context),
                  hintText: '请输设备IP'),
            ),
          ),
          Padding(
            padding: paddingAll,
            child: TextFormField(
              controller: versionC,
              decoration: InputDecoration(
                  border: outlineInputBorder,
                  labelText: '设备版本',
                  // labelStyle: formTextStyle(context),
                  // hintStyle: formTextStyle(context),
                  hintText: '请输设备编号'),
            ),
          ),
          Padding(
            padding: paddingAll,
            child: TextFormField(
              controller: snC,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '序列号为空';
                }
                return null;
              },
              decoration: InputDecoration(
                  border: outlineInputBorder,
                  labelText: '设备序列号',
                  // labelStyle: formTextStyle(context),
                  // hintStyle: formTextStyle(context),
                  hintText: '请输设备序列号'),
            ),
          ),
        ],
      ),
    );
    return AlertDialog(
      title: const Text('添加设备'),
      content: Container(
        width: 450,
        child: Form(
          key: widget._formKey,
          child: singleChildScrollView,
        ),
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
            Navigator.of(context).pop(false);
          },
        ),
        ElevatedButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: defaultPadding * 1.5,
              vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
            ),
          ),
          onPressed: () async {
            print(widget.device?.id);
            if (widget.device?.id != null) {
              bool isOK = await updateDevice();
              print(isOK);
            } else {
              bool isOK = await addDevice();
              print(isOK);
            }
          },
          child: const Text("保存"),
        )
      ],
    );
  }
}
