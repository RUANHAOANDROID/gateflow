import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

ThemeData MyTheme(context) {
  return ThemeData.light().copyWith(
    scaffoldBackgroundColor: bgColor,
    textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: Colors.white),
    canvasColor: secondaryColor,
  );
}

ThemeData ThemeDark(context) {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: bgColor,
    textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: Colors.white,displayColor: Colors.white70),
    canvasColor: secondaryColor,
    cardColor: bgColor,
    dividerColor: secondaryColor,
  );
}

const outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(width: 1, color: Colors.blueGrey),
  borderRadius: BorderRadius.all(Radius.circular(defaultPadding / 2)),
);

TextStyle? formTextStyle(context) {
  return Theme.of(context).primaryTextTheme.subtitle2;
}
