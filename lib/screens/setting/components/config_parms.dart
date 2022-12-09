import 'package:flutter/material.dart';
import 'package:gateflow/models/config_respons_entity.dart';
import 'package:gateflow/screens/setting/components/row_form.dart';

import '../../../constants.dart';
import '../../../responsive.dart';
import '../setting_screen.dart';

class ParamsConfig extends StatefulWidget {
  const ParamsConfig({
    Key? key,
    this.config,
    required this.saved,
    required this.formKey,
  }) : super(key: key);
  final ValueChanged<ConfigResponsData?> saved;
  final ConfigResponsData? config;
  final GlobalKey<FormState> formKey;

  @override
  State<StatefulWidget> createState() => _ConfigParams();
}

class _ConfigParams extends State<ParamsConfig> {
  var itemPadding =
      Padding(padding: EdgeInsets.only(bottom: defaultPadding / 2));
  var containerPadding =
      Padding(padding: EdgeInsets.only(bottom: defaultPadding / 2));

  @override
  Widget build(BuildContext context) {
    print("config parms build");
    print(widget.config);
    setState(() {

    });
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
                RowFormField(
                  hite1: "厂商标识1",
                  hite2: "厂商标识2",
                  initValue1: widget.config?.manufacturerId1,
                  initValue2: widget.config?.manufacturerId2,
                  vc1: (value) {},
                  vc2: (value) {},
                ),
                RowFormField(
                  hite1: "验票地址",
                  hite2: "核销地址",
                  initValue1: widget.config?.checkUrl,
                  initValue2: widget.config?.writeOffUrl,
                  vc1: (value) {},
                  vc2: (value) {},
                ),
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
                RowFormField(
                  hite1: "普通卡提示",
                  hite2: "其他卡提示",
                  initValue1: widget.config?.deTrueVoice?.normal,
                  initValue2: widget.config?.deTrueVoice?.other,
                  vc1: (value) {},
                  vc2: (value) {},
                ),
                RowFormField(
                  hite1: "年卡1提示",
                  hite2: "年卡2提示",
                  initValue1: widget.config?.deTrueVoice?.yearCard1,
                  initValue2: widget.config?.deTrueVoice?.yearCard2,
                  vc1: (value) {},
                  vc2: (value) {},
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: defaultPadding / 2),
            child: Text(
              "  验票失败提示配置 ",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: Column(
              children: [
                RowFormField(
                  hite1: "无效票提示",
                  hite2: "已验票提示",
                  initValue1: widget.config?.deFalseVoice?.invalid,
                  initValue2: widget.config?.deFalseVoice?.used,
                  vc1: (value) {},
                  vc2: (value) {},
                ),
                RowFormField(
                  hite1: "异常提示",
                  hite2: "其他提示",
                  initValue1: widget.config?.deFalseVoice?.error,
                  initValue2: widget.config?.deFalseVoice?.other,
                  vc1: (value) {},
                  vc2: (value) {},
                ),
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
              onPressed: () {
                widget.saved(widget.config);
              },
              icon: Icon(Icons.save),
              label: Text("保存配置"),
            ),
          ),
        ],
      ),
    );

    return Form(key: widget.formKey, child: container);
  }
}
