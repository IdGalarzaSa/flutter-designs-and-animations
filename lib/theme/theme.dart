import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme;

  ThemeChanger(int themeNumber) {
    switch (themeNumber) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.light();
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
    }
  }

  bool get dartTheme => this._darkTheme;

  bool get customTheme => this._customTheme;

  set dartTheme(bool newValue) {
    _customTheme = false;
    _darkTheme = newValue;
    newValue ? _currentTheme = ThemeData.dark() : _currentTheme = ThemeData.light();
    notifyListeners();
  }

  set customTheme(bool newValue) {
    _customTheme = newValue;
    _darkTheme = false;
    notifyListeners();
  }

  ThemeData get currentTheme => this._currentTheme;
}
