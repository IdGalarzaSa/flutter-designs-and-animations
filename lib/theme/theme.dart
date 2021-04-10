import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme;

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

  get currentTheme => this._currentTheme;
}
