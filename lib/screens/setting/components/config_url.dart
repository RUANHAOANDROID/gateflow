import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../setting_screen.dart';

class ConfigUrl extends StatefulWidget {
  const ConfigUrl({
    Key? key,
    required this.buttonStyleFrom,
  }) : super(key: key);

  final ButtonStyle buttonStyleFrom;

  @override
  State<StatefulWidget> createState() => _ConfigUrl();
}

class _ConfigUrl extends State<ConfigUrl> {
  @override
  Widget build(BuildContext context) {
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
                children: [
                  // WidgetSpan(
                  //   child: Icon(
                  //     Icons.settings,
                  //     color: Colors.blue,
                  //   ),
                  // ),
                  TextSpan(
                    text: " 获取配置 ",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: secondaryColor,
            child: rowConfigPull(widget.buttonStyleFrom),
          )
        ],
      ),
    );
  }

  Row rowConfigPull(ButtonStyle buttonStyleFrom) {
    return Row(
      children: <Widget>[
        Container(
          width: 300,
          padding: EdgeInsets.only(right: defaultPadding),
          child: TextFormField(
            autofocus: true,
            initialValue: "3Y32225000630212",
            decoration: InputDecoration(
              hoverColor: Colors.blueGrey,
              border: OutlineInputBorder(),
              labelText: '设备编号',
              labelStyle: TextStyle(color: Colors.white70),
              hintText: '请输入设备编号',
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
        ),
        Container(
          width: 500,
          padding: EdgeInsets.only(right: defaultPadding),
          child: TextFormField(
            initialValue: 'http://101.43.113.148:8194/',
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '平台地址',
                labelStyle: TextStyle(color: Colors.white70),
                hintText: '获取参数地址',
                hintStyle: TextStyle(color: Colors.white70)),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: ElevatedButton.icon(
            style: buttonStyleFrom,
            onPressed: () {},
            icon: Icon(Icons.sync),
            label: Text("获取配置参数"),
          ),
        ),
      ],
    );
  }
}
