import 'dart:developer';

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
  var padding = const EdgeInsets.only(bottom: defaultPadding / 2);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("config url build");
    final TextEditingController codeController =
        TextEditingController(text: widget.entity.code);
    final TextEditingController urlController =
        TextEditingController(text: widget.entity.url);
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
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        Form(key: widget.formKey, child: rowConfigPull(buttonStyleFrom,codeController,urlController))
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

  Row rowConfigPull(ButtonStyle buttonStyleFrom,codeController,urlController) {
    var paddingAll = const EdgeInsets.all(defaultPadding / 2);
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: paddingAll,
            child: textFormField("设备号", (value) {
              widget.entity.code = value;
              widget.codeUrlChanged(widget.entity);
            },codeController),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
              padding: paddingAll,
              child: textFormField("获取参数地址",(value) {
                print(value);
                widget.entity.url = value;
                widget.codeUrlChanged(widget.entity);
              },urlController)),
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
      String hint, ValueChanged changed, controller) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      //initialValue: initValue,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$hint为空';
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
        labelText: hint,
        // labelStyle: const TextStyle(color: Colors.white70),
        hintText: hint,
        // hintStyle: const TextStyle(color: Colors.white70),
      ),
    );
  }
}
