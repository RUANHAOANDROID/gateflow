import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gateflow/models/config_get_entity.dart';
import 'package:gateflow/models/config_respons_entity.dart';
import 'package:gateflow/models/response_entity.dart';
import 'package:gateflow/utils/http.dart';
import 'package:gateflow/wiidget/mytoast.dart';
import '../../constants.dart';
import '../../controllers/MenuController.dart';
import 'components/config_parms.dart';
import 'components/config_url.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../responsive.dart';

class SettingScreen extends StatefulWidget {
  var formEntity = FormEntity();
  final url = "http://emcs-api.youchiyun.com";
  final code = "3Y32225000630212";

  @override
  State<StatefulWidget> createState() => _SettingScreen();
}

class FormEntity {
  String? url;
  String? code;
  ConfigResponsData? config;
}

class SaveMyConfigEntity {
  String? url;
  String? code;
  String? config;
}

class _SettingScreen extends State<SettingScreen> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  void showTip(String? msg, bool ok) {
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Tip(
    //       tip: '${msg}',
    //       ok: true,
    //     ),
    //   ),
    // );
    FToast().init(context).showToast(child: MyToast(tip: "$msg", ok: ok));
  }

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
          showTip("获取成功", true);
          widget.formEntity.config = stateData;
        });
      }
    } catch (e) {
      print(e);
      showTip(e.toString(), false);
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
      showTip(e.toString(), false);
    }
  }

  void saveConfig() async {
    print("saveConfig");
    var currentState1 = _formKey1.currentState;
    var currentState2 = _formKey2.currentState;
    if (currentState1!.validate() && currentState2!.validate()) {
      var config = widget.formEntity;
      var requestMap = {
        'url': config.url,
        'code': config.code,
        'content': config.config.toString()
      };
      var json =
          await HttpUtils.post("/config/saveMyConfig", jsonEncode(requestMap));
      var response = ResponseEntity.fromJson(json);
      if (response == fail) {}
      var msg = response.msg;
      setState(() {
        showTip(msg, true);
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
    getMyConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.formEntity.url = widget.url;
    widget.formEntity.code = widget.code;
    var config = widget.formEntity.config;

    var title = Padding(
      padding: const EdgeInsets.only(
          left: defaultPadding / 2,
          top: defaultPadding/2,
          bottom: defaultPadding),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: context.read<MenuController>().controlMenu,
            ),
          Text(
            "参数设置",
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
    );
    var pramContainer = ParamsConfig(
      config: config,
      saved: (ConfigResponsData? value) {
        saveConfig();
        print("pram url save");
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
        padding: defaultPaddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            codeUrl,
            const Padding(padding: EdgeInsets.all(defaultPadding / 2)),
            pramContainer,
          ],
        ),
      ),
    );
  }
}
