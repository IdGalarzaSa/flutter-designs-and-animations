import 'package:flutter/material.dart';

class SliderModel extends ChangeNotifier {
  double _currentPage = 0;

  double get currentPage => this._currentPage;

  set currentPage(double newPage) {
    this._currentPage = newPage;
    notifyListeners();
  }
}
