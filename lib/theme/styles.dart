import 'dart:math';

import 'package:flutter/material.dart';

class Styles {
  static const _textSizeLarge = 25.0;
  static const _textSizeDefault = 16.0;

  static final appTheme = ThemeData(
    hintColor: Colors.white,
  );

  static final List<Color> colors = List.generate(100, (index) {
    var baseColor = [
      Colors.cyanAccent,
      Colors.red,
      Colors.yellow,
      Colors.green,
      Colors.redAccent,
      Colors.yellow,
      Colors.green
    ];
    var colorsIndex = index % baseColor.length;
    var r = (baseColor[colorsIndex].red + (Random().nextInt(180))) / 2;
    var g = (baseColor[colorsIndex].green + (Random().nextInt(180))) / 2;
    var b = (baseColor[colorsIndex].blue + (Random().nextInt(180))) / 2;
    return Color.fromRGBO(r.toInt(), g.toInt(), b.toInt(), 1);
  });
}
