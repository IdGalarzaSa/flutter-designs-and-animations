import 'package:flutter/cupertino.dart';
import 'package:flutter_designs/pages/slideshow_page.dart';

class LayoutModel extends ChangeNotifier {
  Widget _currentWidget = SlideshowPage();

  Widget get currentWidget => this._currentWidget;

  set currentWidget(Widget newWidget) {
    this._currentWidget = newWidget;
    notifyListeners();
  }
}
