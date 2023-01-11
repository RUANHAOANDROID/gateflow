import 'package:flutter/material.dart';
import 'package:gateflow/constants.dart';
import 'package:gateflow/controllers/ThemeController.dart';
import 'package:gateflow/models/login_entity.dart';
import 'package:gateflow/models/response_entity.dart';
import 'package:gateflow/responsive.dart';
import 'package:gateflow/screens/main/main_screen.dart';
import 'package:gateflow/screens/setting/setting_screen.dart';
import 'package:gateflow/theme/theme.dart';
import 'package:gateflow/utils/http.dart';
import 'package:gateflow/wiidget/tip.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

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
    double verticalMargin = 100;
    double horizontalMargin = 100;

    double padding = defaultPadding;

    if (Responsive.isDesktop(context)) {
      verticalMargin = 200;
      horizontalMargin = 400;
      padding = defaultPadding*1.5;
    }
    if (Responsive.isTablet(context)) {
      verticalMargin = 100;
      horizontalMargin = 100;
      padding = defaultPadding *1.5;
    }

    if (Responsive.isMobile(context)) {
      verticalMargin = 200;
      horizontalMargin = 50;
      padding = padding;
    }

    var column = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: padding*2, bottom: padding * 2),
          child: Center(
            child: Image.asset(
              'assets/images/logo.png',
              color: Colors.blueAccent,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: padding , bottom: padding,left: padding*4,right: padding*4),
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
                border: outlineInputBorder,
                labelText: '用户名',
                hintText: '请输入用户名'),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(top: padding , bottom: padding,left: padding*4,right: padding*4),
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
        ),
        Padding(
          padding: EdgeInsets.only(top: padding * 2, bottom: padding),
          child: ElevatedButton(
            style: buttonStyle(context),
            onPressed: () {
              login();
            },
            child: const Text(
              '登录',
            ),
          ),
        ),
      ],
    );
    var card = Card(
      elevation: 15.0,
      //设置阴影
      margin: EdgeInsets.symmetric(
          vertical: verticalMargin, horizontal: horizontalMargin),
      color: Theme.of(context).canvasColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0))),
      //设置圆角
      child: Form(
        key: _formKey,
        child: Padding(
          padding: defaultPaddingAll,
          child: Center(
            child: column,
          ),
        ),
      ),
    );
    return Scaffold(body: SingleChildScrollView(child: card,      primary: false,));
  }
}
