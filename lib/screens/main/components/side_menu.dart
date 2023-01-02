import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../login/login_page.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
    required this.pageController,
  }) : super(key: key);
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo1.png"),
          ),
          DrawerListTile(
            title: "运行概要",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              pageController.jumpToPage(0);
            },
          ),
          DrawerListTile(
            title: "设备调试",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              pageController.jumpToPage(1);
            },
          ),
          DrawerListTile(
            title: "参数设置",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              pageController.jumpToPage(2);
            },
          ),
          DrawerListTile(
            title: "设备绑定",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              pageController.jumpToPage(3);
            },
          ),
          DrawerListTile(
            title: "退出登录",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              // Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()));
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => route == null,
              );
              //SystemNavigator.pop();
              //exit(0);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
