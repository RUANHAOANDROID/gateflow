import 'package:flutter/material.dart';

const double _kDrawerHeaderHeight = 160.0 + 1.0; // bottom edge

class MyHeader extends StatelessWidget {
  final String title;

  const MyHeader(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
        width: 500,
        height: statusBarHeight + _kDrawerHeaderHeight,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        decoration: const BoxDecoration(
          color: Colors.blue,
          // image: DecorationImage(
          //   image: AssetImage('asset/images/banner2.png'),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ));
  }
}
