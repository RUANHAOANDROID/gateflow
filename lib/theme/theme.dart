import 'package:flutter/material.dart';

import '../constants.dart';
import '../responsive.dart';

// final ThemeData appTheme = ThemeData(
//
//
//
// );

ButtonStyle buttonStyle(context) {
  return TextButton.styleFrom(
    padding: EdgeInsets.symmetric(
      horizontal: defaultPadding * 1.5,
      vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
    ),
  );
}
const labelStyle= TextStyle(color: Colors.white70);
const hintStyle= TextStyle(color: Colors.white70);
