import 'package:flutter/material.dart';
import 'package:gateflow/screens/setting/components/row_form.dart';

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
          Text(
            "业务配置 ",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: Column(
              children: [
                RowFormField(hite1: "厂商标识1", hite2: "厂商标识2"),
                RowFormField(hite1: "验票地址", hite2: "核销地址"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: defaultPadding),
            child: Text(
              "  验票通过提示配置 ",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: Column(
              children: [
                RowFormField(hite1: "普通卡提示", hite2: "其他卡提示"),
                RowFormField(hite1: "年卡1提示", hite2: "年卡2提示"),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: defaultPadding/2),
            child: Text(
              "  验票失败提示配置 ",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: Column(
              children: [
                RowFormField(hite1: "无效票提示", hite2: "已验票提示"),
                RowFormField(hite1: "异常提示", hite2: "其他提示"),
              ],
            ),
          ),
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
}
