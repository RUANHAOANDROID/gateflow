import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gateflow/controllers/ThemeController.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../controllers/MenuItemController.dart';
import '../../../responsive.dart';
import '../../../wiidget/custom_status.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkModel = Provider.of<ThemeController>(context).isDarkMode;
    Color _activeColor;
    String _model;
    if (isDarkModel) {
      _activeColor = Colors.grey;
      _model = "暗黑模式";
    } else {
      _activeColor = Colors.grey;
      _model = "明亮模式";
    }
    var switchListTile = SwitchListTile(
      title: Text(_model),
      contentPadding: const EdgeInsets.only(left: 8,right: 8),
      activeColor: _activeColor,
      value: isDarkModel,
      inactiveThumbImage: const AssetImage('assets/images/dark_mode.png'),
      activeThumbImage: const AssetImage('assets/images/light_mode_sunny.png'),
      onChanged: (selected) {
        isDarkModel = selected;
        context.read<ThemeController>().setTheme(selected);
      },
    );
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: context.read<MenuItemController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            "运行概要",
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        SizedBox(
         width: 180,
          child: switchListTile,
        ),
        const ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var card = Card(
        margin: const EdgeInsets.only(left: defaultPadding / 2),
        elevation: 10.0,
        //设置阴影
        color: Theme.of(context).canvasColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        //设置圆角
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: defaultPadding / 2, horizontal: defaultPadding / 2),
          child: CustomStatus(
            color: Colors.green,
            status: "通讯正常  ",
          ),
        ));
    return card;
  }
}
