import 'package:flutter/material.dart';
import 'package:gateflow/login/login_page.dart';
import 'package:gateflow/screens/main/main_screen.dart';
import 'package:gateflow/theme/theme.dart';

import 'constants.dart';
import 'controllers/MenuController.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: MaterialApp(
          theme: MyTheme(context),
          home: LoginScreen(),
        ),
      ),
    );
  }
}
