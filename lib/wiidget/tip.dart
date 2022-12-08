import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';

class Tip extends StatelessWidget {
  final String tip;

  const Tip({Key? key, required this.tip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double myHeight = 40;
    if (Responsive.isDesktop(context)) {
      myHeight = 30;
    }
    return Container(
      height: myHeight,
      alignment: Alignment.center,
      child: Text(
        "$tip",
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
