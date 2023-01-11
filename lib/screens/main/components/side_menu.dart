import 'package:flutter/material.dart';
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
        physics: const NeverScrollableScrollPhysics(),
        children: [
          DrawerHeader(
            child: Image.asset(
              "assets/images/logo.png",
              color: Colors.blueAccent,
            ),
          ),
          DrawerListTile(
            title: "运行概要",
            icon: Icons.dashboard,
            press: () {
              pageController.jumpToPage(0);
            },
          ),
          DrawerListTile(
            title: "设备调试",
            icon: Icons.hardware,
            press: () {
              pageController.jumpToPage(1);
            },
          ),
          DrawerListTile(
            title: "参数设置",
            icon: Icons.pattern,
            press: () {
              pageController.jumpToPage(2);
            },
          ),
          DrawerListTile(
            title: "设备绑定",
            icon: Icons.devices,
            press: () {
              pageController.jumpToPage(3);
            },
          ),
          DrawerListTile(
            title: "退出登录",
            icon: Icons.logout,
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
    required this.title,
    required this.press,
    required this.icon,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }
}
