import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../responsive.dart';
import '../setting_screen.dart';

class ParamsConfig extends StatefulWidget {
  const ParamsConfig({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ConfigParams();
}

class _ConfigParams extends State<ParamsConfig> {
  final _formKey = GlobalKey<FormState>();

  var itemPadding =
      Padding(padding: EdgeInsets.only(bottom: defaultPadding / 2));
  var containerPadding =
      Padding(padding: EdgeInsets.only(bottom: defaultPadding / 2));

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
                    text: "  业务配置",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: Column(
              children: [
                pramsWidget(),
                itemPadding,
                row2(),
                itemPadding,
                row3(),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: defaultPadding, bottom: defaultPadding),
            child: Text(
              "  验票通过提示配置 ",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: Column(
              children: [
                row4(),
                itemPadding,
                row5(),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: defaultPadding, bottom: defaultPadding),
            child: Text(
              "  验票失败提示配置 ",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: Column(
              children: [
                row6(),
                itemPadding,
                row7(),
              ],
            ),
          ),
          itemPadding,
          Center(
            child: ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {},
              icon: Icon(Icons.save),
              label: Text("保存配置"),
            ),
          ),
        ],
      ),
    );

    return Form(key: _formKey, child: container);
  }

  Row pramsWidget() {
    return Row(
      children: <Widget>[
        Container(
          width: 300,
          padding: EdgeInsets.only(right: defaultPadding),
          child: TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              hoverColor: Colors.blueGrey,
              border: OutlineInputBorder(),
              labelText: '厂商标识1',
              labelStyle: TextStyle(color: Colors.white70),
              hintText: '厂商标识1',
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
        ),
        Container(
          width: 300,
          padding: EdgeInsets.only(right: defaultPadding),
          child: TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              hoverColor: Colors.blueGrey,
              border: OutlineInputBorder(),
              labelText: '厂商标识2',
              labelStyle: TextStyle(color: Colors.white70),
              hintText: '厂商标识2',
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
        ),
      ],
    );
  }

  /**
   * 1.上报间隔时间
   * 2.心跳间隔时间
   * 3.验票地址
   * 4.核销地址
   */
  Row row2() {
    return Row(
      children: <Widget>[
        Container(
          width: 500,
          padding: EdgeInsets.only(right: defaultPadding),
          child: Expanded(
            child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hoverColor: Colors.blueGrey,
                border: OutlineInputBorder(),
                labelText: '验票地址',
                labelStyle: TextStyle(color: Colors.white70),
                hintText: '验票地址',
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
        Container(
          width: 500,
          padding: EdgeInsets.only(right: defaultPadding),
          child: Expanded(
            child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hoverColor: Colors.blueGrey,
                border: OutlineInputBorder(),
                labelText: '验票地址',
                labelStyle: TextStyle(color: Colors.white70),
                hintText: '验票地址',
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row row3() {
    return Row(
      children: <Widget>[
        Container(
          width: 500,
          padding: EdgeInsets.only(right: defaultPadding),
          child: Expanded(
            child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hoverColor: Colors.blueGrey,
                border: OutlineInputBorder(),
                labelText: '人数上报间隔时间(秒)',
                labelStyle: TextStyle(color: Colors.white70),
                hintText: '人数上报间隔时间(秒)',
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
        Container(
          width: 500,
          padding: EdgeInsets.only(right: defaultPadding),
          child: Expanded(
            child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hoverColor: Colors.blueGrey,
                border: OutlineInputBorder(),
                labelText: '心跳间隔时间(秒)',
                labelStyle: TextStyle(color: Colors.white70),
                hintText: '心跳间隔时间(秒)',
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row row5() {
    return Row(
      children: <Widget>[
        Container(
          width: 500,
          padding: EdgeInsets.only(right: defaultPadding),
          child: Expanded(
            child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hoverColor: Colors.blueGrey,
                border: OutlineInputBorder(),
                labelText: '年卡1提示',
                labelStyle: TextStyle(color: Colors.white70),
                hintText: '年卡1提示',
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
        Container(
          width: 500,
          padding: EdgeInsets.only(right: defaultPadding),
          child: Expanded(
            child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hoverColor: Colors.blueGrey,
                border: OutlineInputBorder(),
                labelText: '年卡2提示',
                labelStyle: TextStyle(color: Colors.white70),
                hintText: '年卡2提示',
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row row4() {
    return Row(
      children: <Widget>[
        Container(
          width: 500,
          padding: EdgeInsets.only(right: defaultPadding),
          child: Expanded(
            child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hoverColor: Colors.blueGrey,
                border: OutlineInputBorder(),
                labelText: '普通卡提示',
                labelStyle: TextStyle(color: Colors.white70),
                hintText: '普通卡提示',
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
        Container(
          width: 500,
          padding: EdgeInsets.only(right: defaultPadding),
          child: Expanded(
            child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hoverColor: Colors.blueGrey,
                border: OutlineInputBorder(),
                labelText: '其他卡提示',
                labelStyle: TextStyle(color: Colors.white70),
                hintText: '其他卡提示',
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row row6() {
    return Row(
      children: <Widget>[
        Container(
          width: 500,
          padding: EdgeInsets.only(right: defaultPadding),
          child: Expanded(
            child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hoverColor: Colors.blueGrey,
                border: OutlineInputBorder(),
                labelText: '无效票提示',
                labelStyle: TextStyle(color: Colors.white70),
                hintText: '无效票提示',
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
        Container(
          width: 500,
          padding: EdgeInsets.only(right: defaultPadding),
          child: Expanded(
            child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hoverColor: Colors.blueGrey,
                border: OutlineInputBorder(),
                labelText: '已验票提示',
                labelStyle: TextStyle(color: Colors.white70),
                hintText: '已验票提示',
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row row7() {
    return Row(
      children: <Widget>[
        Container(
          width: 500,
          padding: EdgeInsets.only(right: defaultPadding),
          child: Expanded(
            child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hoverColor: Colors.blueGrey,
                border: OutlineInputBorder(),
                labelText: '异常提示',
                labelStyle: TextStyle(color: Colors.white70),
                hintText: '异常提示',
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
        Container(
          width: 500,
          padding: EdgeInsets.only(right: defaultPadding),
          child: Expanded(
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              autofocus: true,
              decoration: InputDecoration(
                hoverColor: Colors.blueGrey,
                border: OutlineInputBorder(),
                labelText: '其他提示',
                labelStyle: TextStyle(color: Colors.white70),
                hintText: '其他提示',
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
