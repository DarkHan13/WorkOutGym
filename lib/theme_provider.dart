import 'package:flutter/material.dart';

enum ThemeName {
  dark,
  light,
  defaultTheme,
}

class ThemeProvider with ChangeNotifier {
  ThemeName themeName = ThemeName.dark;

  void toggleTheme(ThemeName themeName) {
    this.themeName = themeName;
    notifyListeners();
  }
}
