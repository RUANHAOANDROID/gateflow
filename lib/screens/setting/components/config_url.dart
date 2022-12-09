import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../responsive.dart';

class ConfigUrl extends StatefulWidget {
  const ConfigUrl({
    Key? key,
    required this.urlChanged,
    required this.codeChanged,
  }) : super(key: key);

  final ValueChanged urlChanged;
  final ValueChanged codeChanged;

  @override
  State<StatefulWidget> createState() => _ConfigUrl();
}

class _ConfigUrl extends State<ConfigUrl> {
  @override
  Widget build(BuildContext context) {
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
            child: rowConfigPull(buttonStyleFrom),
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
            child:
                textFormField("设备编号", "3Y32224500630212", widget.codeChanged),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
              padding: EdgeInsets.all(defaultPadding / 2),
              child: textFormField(
                  "获取参数地址", "http://101.43.113.148:8194", widget.urlChanged)),
        ),
        Padding(
          padding: EdgeInsets.all(defaultPadding / 2),
          child: ElevatedButton.icon(
            style: buttonStyleFrom,
            onPressed: () {},
            icon: Icon(Icons.sync),
            label: Text("获取"),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(defaultPadding / 2),
          child: ElevatedButton.icon(
            style: buttonStyleFrom,
            onPressed: () {},
            icon: Icon(Icons.save),
            label: Text("保存"),
          ),
        ),
      ],
    );
  }

  TextFormField textFormField(
      String hite, String initValue, ValueChanged changed) {
    return TextFormField(
      autofocus: true,
      initialValue: initValue,
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
