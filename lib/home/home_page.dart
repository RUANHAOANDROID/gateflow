import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gateflow/home/home_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _hidDrawer() {
    Navigator.pop(context);
  }

  static const IconData copyright =
      IconData(0xe198, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GateFlow'),
      ),
      drawer: Drawer(
        child: Column(
          //padding: EdgeInsets.zero,
          children: [
            const MyHeader('GateFlow-Desktop'),
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
    );
  }
}
