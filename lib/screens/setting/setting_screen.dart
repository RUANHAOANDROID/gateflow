import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../responsive.dart';
import 'components/config_parms.dart';
import 'components/config_url.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var buttonStyleFrom = TextButton.styleFrom(
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding * 1.5,
        vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
      ),
    );

    var title = Padding(
      padding: EdgeInsets.only(bottom: defaultPadding),
      child: Text(
        "参数设置",
        style: Theme.of(context).textTheme.headline6,
      ),
    );

    var pramContainer = ParamsConfig();
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            ConfigUrl(buttonStyleFrom: buttonStyleFrom),
            Padding(padding: EdgeInsets.all(defaultPadding / 2)),
            pramContainer,
          ],
        ),
      ),
    );
  }
}




