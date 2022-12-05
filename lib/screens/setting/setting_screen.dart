import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/DeviceInfo.dart';
import '../../responsive.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttonStyleFrom = TextButton.styleFrom(
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding * 1.5,
        vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
      ),
    );
    var content = Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.settings,
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: "  获取配置 ",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
          Container(
            color: secondaryColor,
            child: Row(
              children: <Widget>[
                Container(
                  width: 300,
                  padding:EdgeInsets.only(right: defaultPadding) ,
                  child: Expanded(
                    child: TextField(
                      autofocus:true ,
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
                ),
                Expanded(
                  child: TextFormField(
                    initialValue: 'http://101.43.113.148:8194/',
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '平台地址',
                        labelStyle: TextStyle(color: Colors.white70),
                        hintText: '请输入平台地址',
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
            ),
          ),
        ],
      ),
    );
    var title = Padding(
      padding: EdgeInsets.only(bottom: defaultPadding),
      child: Text(
        "参数设置",
        style: Theme.of(context).textTheme.headline6,
      ),
    );
    return SafeArea(
        child: SingleChildScrollView(
            primary: false,
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [title, content])));
  }
}
