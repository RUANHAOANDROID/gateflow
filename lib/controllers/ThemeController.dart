import 'package:flutter/material.dart';

import '../main.dart';

class ThemeController extends ChangeNotifier {


  bool _isDark = true;

  bool get isDarkMode => _isDark;

  void setTheme(bool isDark) {
    _isDark = isDark;
    notifyListeners();
  }
}
