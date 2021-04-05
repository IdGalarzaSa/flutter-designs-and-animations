import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_designs/widgets/floating_bottom_menu_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  static final routeName = "PinterestPage";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return new _MenuModelProvider();
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              PinterestGrid(),
              _Menu(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final showMenu = Provider.of<_MenuModelProvider>(context).showMenu;

    final List<FloatingBottomMenuButton> menu = [
      FloatingBottomMenuButton(iconData: Icons.pie_chart, onPressed: () => print("menu 1")),
      FloatingBottomMenuButton(iconData: Icons.notifications, onPressed: () => print("menu 2")),
      FloatingBottomMenuButton(iconData: Icons.add, onPressed: () => print("menu 3")),
      FloatingBottomMenuButton(iconData: Icons.list, onPressed: () => print("menu 4")),
      FloatingBottomMenuButton(iconData: Icons.settings, onPressed: () => print("menu 5")),
    ];

    return Positioned(
      bottom: 30,
      child: Container(
        width: screenWidth,
        child: Align(
            child: FloatingBottomMenuWidget(
          showMenu: showMenu,
          backgroundMenuColor: Colors.blueGrey,
          iconActiveColor: Colors.orange,
          iconInactiveColor: Colors.black,
          menuButtonList: menu,
        )),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> itemList = List.generate(200, (index) => index);
  final scrollController = new ScrollController();
  double previousScrollValue = 0;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset > previousScrollValue && scrollController.offset > 150) {
        Provider.of<_MenuModelProvider>(context, listen: false).showMenu = false;
      } else {
        Provider.of<_MenuModelProvider>(context, listen: false).showMenu = true;
      }
      previousScrollValue = scrollController.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: scrollController,
      crossAxisCount: 4,
      itemCount: itemList.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) => new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.all(Radius.circular(25))),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModelProvider extends ChangeNotifier {
  bool _showMenu = true;

  get showMenu => this._showMenu;

  set showMenu(bool newValue) {
    this._showMenu = newValue;
    notifyListeners();
  }
}
