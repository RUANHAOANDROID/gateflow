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

const outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(width: 1, color: Colors.blueGrey),
  borderRadius: const BorderRadius.all(Radius.circular(defaultPadding / 2)),
);

TextStyle? formTextStyle(context) {
  return Theme.of(context).primaryTextTheme.subtitle2;
}
