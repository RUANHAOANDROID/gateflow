import 'package:flutter/material.dart';
import 'package:gateflow/login/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../controllers/MenuController.dart';
import '../../responsive.dart';
import '../bind/bind_screen.dart';
import '../dashboard/mydashboard_screen.dart';
import '../setting/setting_screen.dart';
import '../test/test_screen.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  final PageController _controller = PageController(
    initialPage: 0,
  );
  var pages = [
    MyDashboardScreen(),
    TestScreen(),
    SettingScreen(),
    BindScreen()
  ];

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(
        pageController: _controller,
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(
                  pageController: _controller,
                ),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: PageView(
                scrollDirection: Axis.vertical,
                controller: _controller,
                pageSnapping: false,
                physics: const NeverScrollableScrollPhysics(),
                children: pages,
              ),
            ),
          ],
        ),
      ),
    );
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
        child: scaffold,
      ),
    );
  }
}
