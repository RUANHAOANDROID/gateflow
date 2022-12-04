//import 'dart:ffi';

import 'package:element_ui/widgets.dart';
import 'package:flutter/material.dart';

//import 'package:flutter/rendering.dart';
import 'package:gateflow/home/home_header.dart';
import 'package:gateflow/home/home_page.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  _hidDrawer() {
    Navigator.pop(context);
  }

  static const IconData copyright =
      IconData(0xe198, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.info_rounded),
                title: Text('运行概要'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.developer_board),
                title: Text('设备调试'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('参数设置'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.device_hub_outlined),
                title: const Text('设备绑定'),
                onTap: () {},
              ),
              ElevatedButton(onPressed: () {}, child: Text("data")),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: const [
                      Text("Copyright",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      Icon(copyright),
                      Text(
                        'www.hao88.cloud',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
