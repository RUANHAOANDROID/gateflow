import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gateflow/models/config_get_entity.dart';
import 'package:gateflow/models/config_response_entity.dart';
import 'package:gateflow/models/custom_config_entity.dart';
import 'package:gateflow/models/response_entity.dart';
import 'package:gateflow/net/http.dart';
import 'package:gateflow/utils/http.dart';
import 'package:gateflow/wiidget/mytoast.dart';
import '../../constants.dart';
import '../../controllers/MenuItemController.dart';
import 'components/config_parms.dart';
import 'components/config_url.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;
import '../../../responsive.dart';

class FormEntity {
  String? url="";
  String? code="";
  ConfigResponseData? config;
}

class SaveMyConfigEntity {
  String? url;
  String? code;
  String? config;
}

class SettingScreen extends StatefulWidget {
  var formEntity = FormEntity();

  SettingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  void showTip(String? msg, bool ok) {
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
        var basic = ConfigResponseEntity.fromJson(responseBody);
        var stateData = basic.data;
        if (basic.code == 0) {
          setState(() {
            showTip("获取成功", true);
            widget.formEntity.config = stateData;
          });
        } else {
          setState(() {
            showTip(basic.msg, false);
          });
        }
      }
    } catch (e) {
      showTip(e.toString(), false);
    }
  }
  void getCodeUrl()async {
    var response = await HttpManager.getCodeUrl();
    if(response.isNotEmpty){
      var _code = response["data"]["code"];
      var _url = response["data"]["url"];
      developer.log("code $_code url $_url");
      widget.formEntity.code =_code;
      widget.formEntity.url =_url;
      setState(() {

      });
    }
  }
  //个人配置
  void getMyConfig() async {
    try {
      developer.log("init get my config");
      var requestBody = ConfigGetEntity();
      requestBody.id = widget.formEntity.code;
      requestBody.configUrl = widget.formEntity.url;
      var response = await HttpUtils.post("/config/getCustomConfig", "");
      var respBody = CustomConfigEntity.fromJson(response);
      if (respBody.code==success && respBody.data!= null) {
        setState(() {
          widget.formEntity.url=respBody.data?.url;
          widget.formEntity.code=respBody.data?.code;
          widget.formEntity.config = respBody.data?.config;
        });
      } else {
        showTip("暂无配置", true);
      }
    } catch (e, stackTrace) {
      showTip("获取配置失败", false);
      developer.log("getConfig", error: e, stackTrace: stackTrace);
    }
  }

  void saveConfig() async {
    developer.log("saveConfig");
    var currentState1 = _formKey1.currentState;
    var currentState2 = _formKey2.currentState;
    if (currentState1!.validate() && currentState2!.validate()) {
      var config = widget.formEntity;
      var requestMap = {
        'url': config.url,
        'code': config.code,
        'config': config.config
      };
      var json = await HttpUtils.post(
          "/config/saveCustomConfig", jsonEncode(requestMap));
      var response = ResponseEntity.fromJson(json);
      setState(() {
        showTip(response.msg, response.code == success);
      });
    } else {
      developer.log("code or url is null");
    }
  }

  @override
  void initState() {
    developer.log("initState");
    super.initState();
    getMyConfig();
    getCodeUrl();
  }

  @override
  Widget build(BuildContext context) {
    var config = widget.formEntity.config;

    var title = Padding(
      padding: const EdgeInsets.only(
          left: defaultPadding / 2,
          top: defaultPadding / 2,
          bottom: defaultPadding),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: context.read<MenuItemController>().controlMenu,
            ),
          Text(
            "参数设置",
            style: Theme.of(context).textTheme.headlineSmall,
          )
        ],
      ),
    );
    var pramContainer = ParamsConfig(
      config: config,
      saved: (ConfigResponseData? value) {
        saveConfig();
        developer.log("pram url save");
      },
      formKey: _formKey2,
    );
    var codeUrlWidget = ConfigUrl(
      get: () {
        getConfig();
      },
      saved: () {
        saveConfig();
        developer.log("save configurl");
      },
      formKey: _formKey1,
      entity: widget.formEntity,
      codeUrlChanged: (FormEntity value) {
        widget.formEntity.url = value.url;
        widget.formEntity.code = value.code;
        developer.log(value.url.toString());
        developer.log(value.code.toString());
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
            codeUrlWidget,
            const Padding(padding: EdgeInsets.all(defaultPadding / 2)),
            pramContainer,
          ],
        ),
      ),
    );
  }
}
