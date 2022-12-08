import 'package:flutter/material.dart';
import 'package:gateflow/constants.dart';
import 'package:gateflow/screens/main/main_screen.dart';
import 'package:gateflow/screens/setting/setting_screen.dart';
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

  void goLogin() {
    var currentState = _formKey.currentState;
    if (currentState!.validate()) {
      currentState.save();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Tip(tip: "AAAA"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var column = Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 100, bottom: 100),
          child: Center(
            child: SizedBox(
                width: 200,
                height: 150,
                child: Image.asset('assets/images/logo1.png')),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
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
                border: OutlineInputBorder(),
                labelText: '用户名',
                hintText: '请输入用户名'),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
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
                border: OutlineInputBorder(),
                labelText: '密码',
                hintText: '请输入密码'),
          ),
        ),
        Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20)),
          child: ElevatedButton(
            onPressed: () {
              toMain();
            },
            child: const Text(
              '登录',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        const SizedBox(
          height: 130,
        ),
        TextButton(
          onPressed: () {
            goLogin();
          },
          child: const Text(
            '修改密码',
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: bgColor,
      // appBar: AppBar(
      //   title: const Text("登录"),
      // ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: column,
        ),
      ),
    );
  }
}
