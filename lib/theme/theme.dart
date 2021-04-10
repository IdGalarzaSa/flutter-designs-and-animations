import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  bool get dartTheme => this._darkTheme;

  bool get customTheme => this._customTheme;

  set dartTheme(bool newValue) {
    _customTheme = false;
    _darkTheme = newValue;
    notifyListeners();
  }

  set customTheme(bool newValue) {
    _customTheme = newValue;
    _darkTheme = false;
    notifyListeners();
  }
}
