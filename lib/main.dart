import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gateflow/controllers/ThemeController.dart';
import 'package:gateflow/net/http.dart';
  import 'package:gateflow/screens/login/login_page.dart';
import 'package:gateflow/screens/main/main_screen.dart';
import 'package:gateflow/theme/theme.dart';
import 'package:gateflow/utils/http.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as dev;

import 'controllers/MenuItemController.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MenuItemController()),
      ChangeNotifierProvider(
        create: (context) => ThemeController(),
        child: MyAppState(),
      ),
    ],
    child: MyAppState(),
  ));
}

class MyAppState extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=>_MyAppState();
}
class _MyAppState extends State<MyAppState> {

  syncTheme(context)async{
    var resp =await HttpManager.getTheme();
    int isDark =resp["data"];
    Provider.of<ThemeController>(context,listen: false).setTheme(isDark==1);
  }

  _getTheme(context){
    return Provider.of<ThemeController>(context).isDarkMode
        ? ThemeDark(context)
        : ThemeLight(context);
  }
  @override
  void initState() {
    syncTheme(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    dev.log("_MyAppState build app");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Gate Flow',
      //theme: ThemeLight(context),
      theme: _getTheme(context),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', 'CH'),
        Locale('en', 'US'),
      ],
      locale: const Locale('zh'),
      home: const LoginScreen(),
      //initialRoute: "/",
    );
  }

}
class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
