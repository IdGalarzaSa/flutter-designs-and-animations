import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FloatingBottomMenuButton {
  final IconData iconData;
  final Function onPressed;

  FloatingBottomMenuButton({@required this.iconData, @required this.onPressed});
}

class FloatingBottomMenuWidget extends StatelessWidget {
  final List<FloatingBottomMenuButton> menuButtonList;
  final bool showMenu;
  final Color backgroundMenuColor;
  final Color iconActiveColor;
  final Color iconInactiveColor;

  FloatingBottomMenuWidget({
    @required this.menuButtonList,
    @required this.showMenu,
    this.backgroundMenuColor = Colors.white,
    this.iconActiveColor = Colors.blueGrey,
    this.iconInactiveColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: showMenu ? 1 : 0,
        child: Visibility(
          visible: showMenu,
          child: Builder(builder: (BuildContext context) {
            final menuProvider = Provider.of<_MenuModel>(context);
            menuProvider.backgroundMenuColor = this.backgroundMenuColor;
            menuProvider.iconActiveColor = this.iconActiveColor;
            menuProvider.iconInactiveColor = this.iconInactiveColor;

            return _BackgroundMenu(child: _ButtonsMenu(menuButtonList));
          }),
        ),
      ),
    );
  }
}

class _BackgroundMenu extends StatelessWidget {
  final Widget child;
  _BackgroundMenu({@required this.child});

  @override
  Widget build(BuildContext context) {
    Color backgroundMenuColor = Provider.of<_MenuModel>(context)._backgroundMenuColor;

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
          color: menuModel.selectedMenuIndex == index ? menuModel.iconActiveColor : menuModel.iconInactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel extends ChangeNotifier {
  int _selectedMenuIndex = 0;
  Color _backgroundMenuColor = Colors.white;
  Color _iconActiveColor = Colors.black;
  Color _iconInactiveColor = Colors.blueGrey;

  get selectedMenuIndex => this._selectedMenuIndex;

  set selectedMenuIndex(int newSelectedMenuIndex) {
    this._selectedMenuIndex = newSelectedMenuIndex;
    notifyListeners();
  }

  get backgroundMenuColor => this._backgroundMenuColor;

  set backgroundMenuColor(Color newValue) {
    this._backgroundMenuColor = newValue;
    notifyListeners();
  }

  get iconActiveColor => this._iconActiveColor;

  set iconActiveColor(Color newValue) {
    this._iconActiveColor = newValue;
    notifyListeners();
  }

  get iconInactiveColor => this._iconInactiveColor;

  set iconInactiveColor(Color newValue) {
    this._iconInactiveColor = newValue;
    notifyListeners();
  }
}
