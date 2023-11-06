import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gateflow/screens/setting/setting_screen.dart';

import '../../../constants.dart';
import '../../../models/macurl_entity.dart';
import '../../../responsive.dart';
import '../../../utils/http.dart';

class ConfigUrl extends StatefulWidget {
  ConfigUrl({
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
  var padding = const EdgeInsets.only(bottom: defaultPadding / 2);

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("config url build");
    var buttonStyleFrom = TextButton.styleFrom(
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding * 1.5,
        vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
      ),
    );
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding,
          child: RichText(
            text: TextSpan(
              text: " 获取配置 ",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
        Container(
          child:
              Form(key: widget.formKey, child: rowConfigPull(buttonStyleFrom)),
        )
      ],
    );
    return Card(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: column,
      ),
    );
  }

  Row rowConfigPull(ButtonStyle buttonStyleFrom) {
    var paddingAll = const EdgeInsets.all(defaultPadding / 2);
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: paddingAll,
            child: textFormField("设备编号", widget.entity.code, (value) {
              widget.entity.code = value;
              widget.codeUrlChanged(widget.entity);
              print(value);
            }),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
              padding: paddingAll,
              child: textFormField("获取参数地址", widget.entity.url, (value) {
                print(value);
                widget.entity.url = value;
                widget.codeUrlChanged(widget.entity);
              })),
        ),
        Padding(
          padding: paddingAll,
          child: ElevatedButton.icon(
            style: buttonStyleFrom,
            onPressed: widget.get,
            icon: const Icon(Icons.sync),
            label: const Text("获取"),
          ),
        ),
        Padding(
          padding: paddingAll,
          child: ElevatedButton.icon(
            style: buttonStyleFrom,
            onPressed: widget.saved,
            icon: const Icon(Icons.save),
            label: const Text("保存"),
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
        border: const OutlineInputBorder(),
        labelText: hite,
        // labelStyle: const TextStyle(color: Colors.white70),
        hintText: hite,
        // hintStyle: const TextStyle(color: Colors.white70),
      ),
    );
  }
}
