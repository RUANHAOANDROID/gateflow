import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gateflow/controllers/ThemeController.dart';
import 'package:gateflow/screens/login/login_page.dart';
import 'package:gateflow/screens/main/main_screen.dart';
import 'package:gateflow/theme/theme.dart';
import 'package:provider/provider.dart';

import 'controllers/MenuController.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MenuController()),
      ChangeNotifierProvider(
        create: (context) => ThemeController(),
        child: MyAppState(),
      ),
    ],
    child: MyAppState(),
  ));
}

class MyAppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("_MyAppState build app");
    _getTheme() {
      return Provider.of<ThemeController>(context).isDarkMode
          ? ThemeDark(context)
          : ThemeLight(context);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Gate Flow',
      //theme: ThemeLight(context),
      theme: _getTheme(),
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
      home: MainScreen(),
      //initialRoute: "/",
    );
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
