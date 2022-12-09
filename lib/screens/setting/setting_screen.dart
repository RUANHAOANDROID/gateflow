import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gateflow/models/config_get_entity.dart';
import 'package:gateflow/models/config_respons_entity.dart';
import 'package:gateflow/models/response_entity.dart';
import 'package:gateflow/utils/http.dart';
import '../../constants.dart';
import '../../responsive.dart';
import '../../wiidget/tip.dart';
import 'components/config_parms.dart';
import 'components/config_url.dart';

class SettingScreen extends StatefulWidget {
  var formEntity = FormEntity();
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

  // 云端配置
  void getConfig() async {
    try {
      var currentState1 = _formKey1.currentState;
      if (currentState1!.validate()) {
        var requestBody = ConfigGetEntity();
        requestBody.id = widget.formEntity.code;
        requestBody.configUrl = widget.formEntity.url;
        var responseBody =
            await HttpUtils.post("/config/getConfig", requestBody);
        var stateData = ConfigResponsEntity.fromJson(responseBody).data;
        setState(() {
          widget.formEntity.config = stateData;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  //个人配置
  void getMyConfig() async {
    try {
      print("init get my config");
      var requestBody = ConfigGetEntity();
      requestBody.id = widget.formEntity.code;
      requestBody.configUrl = widget.formEntity.url;
      var json = await HttpUtils.post("/config/getMyConfig", "");
      var string = ResponseEntity.fromJson(json).data;
      print("Json String ");
      print(string);
      Map<String, dynamic> myConfigJson = jsonDecode(string!);
      print("Json myConfigJson ");
      print(myConfigJson);
      var config = ConfigResponsData.fromJson(myConfigJson);
      print("config obj ");
      print(config);
      setState(() {
        widget.formEntity.config = config;
      });
    } catch (e) {
      print(e);
    }
  }

  void saveConfig() async {
    print("saveConfig");
    var currentState1 = _formKey1.currentState;
    var currentState2 = _formKey2.currentState;
    if (currentState1!.validate() && currentState2!.validate()) {
      var requestBody = widget.formEntity.config;
      var json =
          await HttpUtils.post("/config/saveMyConfig", requestBody.toString());
      var response = ResponseEntity.fromJson(json);

      setState(() {
        if (response == fail) {}
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Tip(
              tip: '${response.msg}',
              ok: true,
            ),
          ),
        );
      });
    } else {
      print("code or url is null");
    }
  }

  @override
  void initState() {
    print("initState");
    widget.formEntity.url = widget.url;
    widget.formEntity.code = widget.code;
    super.initState();
    getMyConfig();
  }

  @override
  Widget build(BuildContext context) {
    widget.formEntity.url = widget.url;
    widget.formEntity.code = widget.code;
    var config = widget.formEntity.config;
    var title = Padding(
      padding: EdgeInsets.only(bottom: defaultPadding),
      child: Text(
        "参数设置",
        style: Theme.of(context).textTheme.headline6,
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
        print("save configurl");
      },
      formKey: _formKey1,
      entity: widget.formEntity,
      codeUrlChanged: (FormEntity value) {
        widget.formEntity.url = value.url;
        widget.formEntity.code = value.code;
        print(value.url);
        print(value.code);
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
