import 'package:flutter/material.dart';
import 'package:gateflow/screens/setting/setting_screen.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class ConfigUrl extends StatefulWidget {
  const ConfigUrl({
    Key? key,
    required this.formKey,
    required this.get,
    required this.saved,
    required this.codeUrlChanged,
    required this.entity,
  }) : super(key: key);
  final ValueChanged<FormEntity> codeUrlChanged;
  final FormEntity entity;
  final VoidCallback saved;
  final VoidCallback get;
  final GlobalKey<FormState> formKey;

  @override
  State<StatefulWidget> createState() => _ConfigUrl();
}

class _ConfigUrl extends State<ConfigUrl> {
  @override
  ConfigUrl get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    print("config url build");
    print("config url build");
    var buttonStyleFrom = TextButton.styleFrom(
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding * 1.5,
        vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
      ),
    );
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: defaultPadding / 2),
            child: RichText(
              text: TextSpan(
                text: " 获取配置 ",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
          Container(
            color: secondaryColor,
            child: Form(
                key: widget.formKey, child: rowConfigPull(buttonStyleFrom)),
          )
        ],
      ),
    );
  }

  Row rowConfigPull(ButtonStyle buttonStyleFrom) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: textFormField("设备编号", widget.entity.code, (value) {
              widget.entity.code = value;
              widget.codeUrlChanged(widget.entity);
            }),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
              padding: EdgeInsets.all(defaultPadding / 2),
              child: textFormField("获取参数地址", widget.entity.url, (value) {
                widget.entity.url = value;
                widget.codeUrlChanged(widget.entity);
              })),
        ),
        Padding(
          padding: EdgeInsets.all(defaultPadding / 2),
          child: ElevatedButton.icon(
            style: buttonStyleFrom,
            onPressed: widget.get,
            icon: Icon(Icons.sync),
            label: Text("获取"),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(defaultPadding / 2),
          child: ElevatedButton.icon(
            style: buttonStyleFrom,
            onPressed: widget.saved,
            icon: Icon(Icons.save),
            label: Text("保存"),
          ),
        ),
      ],
    );
  }

  TextFormField textFormField(
      String hite, String? initValue, ValueChanged changed) {
    return TextFormField(
      autofocus: true,
      initialValue: initValue,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$hite为空';
        }
        return null;
      },
      onSaved: (value) {
        changed(value);
      },
      onChanged: (value) {
        changed(value);
      },
      decoration: InputDecoration(
        hoverColor: Colors.blueGrey,
        border: OutlineInputBorder(),
        labelText: hite,
        labelStyle: TextStyle(color: Colors.white70),
        hintText: hite,
        hintStyle: TextStyle(color: Colors.white70),
      ),
    );
  }
}
