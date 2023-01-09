import 'package:flutter/material.dart';
import 'package:gateflow/constants.dart';
import 'package:gateflow/models/login_entity.dart';
import 'package:gateflow/models/response_entity.dart';
import 'package:gateflow/responsive.dart';
import 'package:gateflow/screens/main/main_screen.dart';
import 'package:gateflow/screens/setting/setting_screen.dart';
import 'package:gateflow/theme/theme.dart';
import 'package:gateflow/utils/http.dart';
import 'package:gateflow/wiidget/tip.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String user = '';
  String pwd = '';

  void toMain() {
    //Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
    //Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
      (route) => route == null,
    );
  }

  void login() {
    var currentState = _formKey.currentState;
    if (currentState!.validate()) {
      currentState.save();
      var loginEntity = LoginEntity();
      loginEntity.userName = user;
      loginEntity.passWord = pwd;
      loginRequest(loginEntity);
    }
  }

  void loginRequest(LoginEntity loginEntity) async {
    try {
      var json = await HttpUtils.post("/admin/login", loginEntity);
      var response = ResponseEntity.fromJson(json);
      if (response.code == success) {
        toMain();
      } else {
        errTip(response.msg);
      }
    } catch (e) {
      errTip(e);
    }
  }

  void errTip(tip) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Tip(tip: tip),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var logWidget = Padding(
      padding: const EdgeInsets.only(
          top: defaultPadding * 2, bottom: defaultPadding * 2),
      child: Center(child: Image.asset('assets/images/logo1.png')),
    );
    var userWidget = Padding(
      padding: EdgeInsets.only(
          top: defaultPadding * 4,
          left: defaultPadding * 8,
          right: defaultPadding * 8),
      child: TextFormField(
        onSaved: (value) {
          user = value!;
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '用户名为空';
          }
          return null;
        },
        decoration: InputDecoration(
            hoverColor: Theme.of(context).hoverColor,
            //labelStyle: formTextStyle(context),
            //hintStyle: formTextStyle(context),
            border: outlineInputBorder,
            labelText: '用户名',
            hintText: '请输入用户名'),
      ),
    );
    var pwdWidget = Padding(
      padding: EdgeInsets.only(
          top: defaultPadding * 2,
          left: defaultPadding * 8,
          right: defaultPadding * 8),
      child: TextFormField(
        onSaved: (value) {
          pwd = value!;
        },
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '密码为空';
          }
          return null;
        },
        decoration: InputDecoration(
            hoverColor: Theme.of(context).highlightColor,
            //labelStyle: formTextStyle(context),
            //hintStyle: formTextStyle(context),
            border: outlineInputBorder,
            labelText: '密码',
            hintText: '请输入密码'),
      ),
    );
    var loginBtnWidget = Padding(
      padding: EdgeInsets.only(top: defaultPadding * 4),
      child: ElevatedButton(
        style: buttonStyle(context),
        onPressed: () {
          login();
        },
        child: const Text(
          '登录',
          //style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
    double paddingLift = 200;
    double paddingRight = 200;
    double paddingTop = 100;
    double paddingBottom = 100;

    return Scaffold(
      //backgroundColor: bgColor,
      // appBar: AppBar(
      //   title: const Text("登录"),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: paddingLift,
              right: paddingRight,
              top: paddingTop,
              bottom: paddingBottom),
          child: Card(
              elevation: 15.0, //设置阴影
              color: Theme.of(context).canvasColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14.0))), //设置圆角
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    logWidget,
                    userWidget,
                    pwdWidget,
                    loginBtnWidget,
                    Padding(
                      padding: EdgeInsets.all(defaultPadding * 2),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
