import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FloatingBottomMenuButton {
  final IconData iconData;
  final Function onPressed;
  Color iconDefaultColor;
  Color iconAccentColor;

  FloatingBottomMenuButton({
    @required this.iconData,
    @required this.onPressed,
    this.iconDefaultColor = Colors.black,
    this.iconAccentColor = Colors.lightBlue,
  });
}

class FloatingBottomMenuWidget extends StatelessWidget {
  final Color backgroundMenuColor;

  FloatingBottomMenuWidget({this.backgroundMenuColor = Colors.white});

  final List<FloatingBottomMenuButton> menuButtonList = [
    FloatingBottomMenuButton(iconData: Icons.pie_chart, onPressed: () => print("menu 1")),
    FloatingBottomMenuButton(iconData: Icons.notifications, onPressed: () => print("menu 2")),
    FloatingBottomMenuButton(iconData: Icons.add, onPressed: () => print("menu 3")),
    FloatingBottomMenuButton(iconData: Icons.list, onPressed: () => print("menu 4")),
    FloatingBottomMenuButton(iconData: Icons.settings, onPressed: () => print("menu 5")),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => new _MenuModel(),
      child: _BackgroundMenu(
        child: _ButtonsMenu(menuButtonList),
        backgroundMenuColor: backgroundMenuColor,
      ),
    );
  }
}

class _BackgroundMenu extends StatelessWidget {
  final Widget child;
  final Color backgroundMenuColor;
  _BackgroundMenu({@required this.child, this.backgroundMenuColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      height: 40,
      width: 250,
      decoration: BoxDecoration(
        color: backgroundMenuColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.white38,
            blurRadius: 10,
            spreadRadius: -3,
          )
        ],
      ),
    );
  }
}

class _ButtonsMenu extends StatelessWidget {
  final List<FloatingBottomMenuButton> menuButtonList;

  _ButtonsMenu(this.menuButtonList);

  @override
  Widget build(BuildContext context) {
    final clickSpace = 1 / menuButtonList.length;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            List.generate(menuButtonList.length, (index) => _MenuButton(index, menuButtonList[index], clickSpace)),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final int index;
  final FloatingBottomMenuButton button;
  final double clickSpace;

  _MenuButton(this.index, this.button, this.clickSpace);

  @override
  Widget build(BuildContext context) {
    final menuModel = Provider.of<_MenuModel>(context, listen: true);

    return GestureDetector(
      onTap: () {
        menuModel.selectedMenuIndex = index;
        button.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
        ),
        padding: EdgeInsets.symmetric(horizontal: clickSpace * 50),
        child: Icon(
          button.iconData,
          size: menuModel.selectedMenuIndex == index ? 30 : 20,
          color: menuModel.selectedMenuIndex == index ? button.iconAccentColor : button.iconDefaultColor,
        ),
      ),
    );
  }
}

class _MenuModel extends ChangeNotifier {
  int _selectedMenuIndex = 0;

  get selectedMenuIndex => this._selectedMenuIndex;

  set selectedMenuIndex(int newSelectedMenuIndex) {
    this._selectedMenuIndex = newSelectedMenuIndex;
    notifyListeners();
  }
}
