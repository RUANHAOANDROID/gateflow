import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gateflow/utils/http.dart';
import '../../constants.dart';
import '../../responsive.dart';
import 'components/config_parms.dart';
import 'components/config_url.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingScreen();
}

class FormEntity {
  String? ft1;
  String? ft2;

  String? checkUrl;
  String? verUrl;

  String? okTip1;
  String? okTip2;
  String? okTip3;
  String? okTip4;

  String? errTip1;
  String? errTip2;
  String? errTip3;
  String? errTip4;
}

class _SettingScreen extends State<SettingScreen> {
  String? url;
  String? code;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  var formEntity = FormEntity();

  void getConfig() async {
    HttpUtils.post("/config/getConfig", "");
  }

  @override
  Widget build(BuildContext context) {
    var title = Padding(
      padding: EdgeInsets.only(bottom: defaultPadding),
      child: Text(
        "参数设置",
        style: Theme.of(context).textTheme.headline6,
      ),
    );

    var pramContainer = ParamsConfig();
    var codeUrl = ConfigUrl(
      codeChanged: (value) {
        url = value;
      },
      urlChanged: (value) {
        code = value;
      },
    );
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            Form(key: _formKey1, child: codeUrl),
            Padding(padding: EdgeInsets.all(defaultPadding / 2)),
            Form(key: _formKey2, child: pramContainer),
          ],
        ),
      ),
    );
  }
}
