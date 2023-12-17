import 'package:flutter/material.dart';
import 'package:weather_application/model/theme_model.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel themeModel = ThemeModel(isDark: false);

  void changetheme() {
    themeModel.isDark = !themeModel.isDark;
    notifyListeners();
  }
}
