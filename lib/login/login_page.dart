import 'package:flutter/material.dart';
import 'package:gateflow/constants.dart';
import 'package:gateflow/screens/main/main_screen.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String user = '';
  String pwd = '';

  void goLogin() {
    var currentState = _formKey.currentState;
    if (currentState!.validate()) {
      currentState.save();
    } else {
      showTip(context,"AAAA");
      // var title = const Icon(
      //   Icons.error,
      //   color: Colors.red,
      // );
      // var tip = const Text(
      //   '表单填写不完整!',
      //   style: TextStyle(color: Colors.red),
      // );
      // var action = SnackBarAction(
      //   label: '重试',
      //   textColor: Colors.blue,
      //   onPressed: () {
      //     // Some code to undo the change.
      //   },
      // );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //       content: Container(
      //     height: defaultPadding,
      //     alignment: Alignment.center,
      //     child: Row(
      //       children: [title, tip, action],
      //     ),
      //   )),
      // );
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
              goLogin();
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (_) => MainScreen()));
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
            //TODO FORGOT PASSWORD SCREEN GOES HERE
          },
          child: const Text(
            '修改密码',
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Colors.white,
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
