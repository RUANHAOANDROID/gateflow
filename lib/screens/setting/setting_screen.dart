import 'dart:convert';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gateflow/models/config_get_entity.dart';
import 'package:gateflow/models/config_respons_entity.dart';
import 'package:gateflow/utils/http.dart';
import '../../constants.dart';
import '../../responsive.dart';
import 'components/config_parms.dart';
import 'components/config_url.dart';

class SettingScreen extends StatefulWidget {
  final formEntity = FormEntity();
  final url = "http://101.43.113.148:8194";
  final code = "3Y32225000630212";

  @override
  State<StatefulWidget> createState() => _SettingScreen();
}

class FormEntity {
  String? url;
  String? code;
  ConfigResponsData? config;
}

class _SettingScreen extends State<SettingScreen> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  @override
  void initState() {
    print("initState");
    widget.formEntity.url = widget.url;
    widget.formEntity.code = widget.code;
    getConfig();
    super.initState();
  }

  void getConfig() async {
    var currentState1 = _formKey1.currentState;
    if (currentState1!.validate()) {
      print(currentState1);
      var requestBody = ConfigGetEntity();
      requestBody.id = widget.formEntity.code;
      requestBody.configUrl = widget.formEntity.url;
      var responseBody = await HttpUtils.post("/config/getConfig", requestBody);
      setState(() {
        widget.formEntity.config =
            ConfigResponsEntity
                .fromJson(responseBody)
                .data;
        print("SetState");
      });
    }
  }

  void saveConfig() {
    var currentState1 = _formKey1.currentState;
    if (currentState1!.validate()) {
      print("code or nul is null");
    }
    var currentState2 = _formKey2.currentState;
    if (currentState2!.validate()) {
      print("params  null");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("setting screen build");
    print(widget.formEntity.config);
    widget.formEntity.url = widget.url;
    widget.formEntity.code = widget.code;
    var config =widget.formEntity.config;
    var title = Padding(
      padding: EdgeInsets.only(bottom: defaultPadding),
      child: Text(
        "参数设置",
        style: Theme
            .of(context)
            .textTheme
            .headline6,
      ),
    );

    var pramContainer = ParamsConfig(
      config: config,
      saved: (ConfigResponsData? value) {
        saveConfig();
        print("save");
      },
      formKey: _formKey2,
    );
    var codeUrl = ConfigUrl(
      get: () {
        getConfig();
      },
      saved: () {
        saveConfig();
      },
      formKey: _formKey1,
      entity: widget.formEntity,
      codeUrlChanged: (FormEntity value) {
        widget.formEntity.url = value.url;
        widget.formEntity.code = value.code;
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
            codeUrl,
            Padding(padding: EdgeInsets.all(defaultPadding / 2)),
            pramContainer,
          ],
        ),
      ),
    );
  }
}
