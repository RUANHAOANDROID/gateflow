import 'package:flutter/material.dart';
import 'package:gateflow/responsive.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);

const defaultPadding = 16.0;

const MyUrl = 'http://localhost:8888';
const ICBC_URL = 'http://localhost:9090';
const EMCS_URL = 'http://localhost:9090';

void showTip(context, tip) {
  double myHeight = 40;
  if (Responsive.isDesktop(context)) {
    myHeight = 30;
  }
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Container(
      height: myHeight,
      alignment: Alignment.center,
      child: Text(
        "$tip",
        style: TextStyle(color: Colors.red),
      ),
    )),
  );
}
