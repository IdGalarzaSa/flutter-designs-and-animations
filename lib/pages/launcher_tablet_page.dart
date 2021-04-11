import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_designs/models/layout_model.dart';
import 'package:flutter_designs/pages/pinterest_page.dart';
import 'package:flutter_designs/routes/routes.dart';
import 'package:flutter_designs/theme/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherTabletPage extends StatelessWidget {
  static final String routeName = 'LauncherTabletPage';

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Diseños flutter - Tablet'),
          backgroundColor: appTheme.currentTheme.accentColor,
        ),
        drawer: _Drawer(),
        body: Row(
          children: [
            Container(width: 400, height: double.infinity, child: _DesignList()),
            Container(
              width: 1,
              height: double.infinity,
              color: appTheme.currentTheme.accentColor,
            ),
            Expanded(child: Container(child: layoutModel.currentWidget)),
          ],
        ));
  }
}

class _Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        color: appTheme.currentTheme.scaffoldBackgroundColor,
        child: Column(
          children: [
            _headerDrawer(appTheme),
            _drawerDivider(),
            Expanded(
              child: _DesignList(),
            ),
            _darkThemeListTile(appTheme),
            _customThemeListTile(appTheme)
          ],
        ),
      ),
    );
  }

  Container _drawerDivider() {
    return Container(
      width: double.infinity,
      height: 2,
      color: Colors.white,
    );
  }

  SafeArea _customThemeListTile(ThemeChanger appTheme) {
    return SafeArea(
      bottom: true,
      left: false,
      right: false,
      top: false,
      child: ListTile(
        leading: Icon(Icons.lightbulb_outline, color: appTheme.currentTheme.accentColor),
        title: Text('Custom Theme'),
        trailing: Switch.adaptive(
          value: appTheme.customTheme,
          onChanged: (newValue) => appTheme.customTheme = newValue,
          activeColor: appTheme.currentTheme.accentColor,
        ),
      ),
    );
  }

  ListTile _darkThemeListTile(ThemeChanger appTheme) {
    return ListTile(
      leading: Icon(Icons.lightbulb_outline, color: appTheme.currentTheme.accentColor),
      title: Text('Dark mode'),
      trailing: Switch.adaptive(
          value: appTheme.dartTheme,
          onChanged: (newValue) => appTheme.dartTheme = newValue,
          activeColor: appTheme.currentTheme.accentColor),
    );
  }

  Widget _headerDrawer(ThemeChanger appTheme) {
    return Container(
        padding: EdgeInsets.all(20),
        height: 100,
        width: double.infinity,
        color: Colors.amberAccent,
        child: SafeArea(
          bottom: false,
          top: false,
          right: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                child: Text(
                  'IG',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Ivan Daniel Galarza Saavedra",
                      textAlign: TextAlign.center,
                    ),
                    Text("Flutter developer"),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class _DesignList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final layoutModel = Provider.of<LayoutModel>(context);

    return ListView.separated(
      itemCount: pageRoutes.length,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) => Divider(color: appTheme.primaryColorLight),
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: FaIcon(pageRoutes[index].icon, color: appTheme.accentColor),
        title: Text(pageRoutes[index].title),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
        onTap: () {
          // Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => pageRoutes[index].page));
          layoutModel.currentWidget = pageRoutes[index].page;
        },
      ),
    );
  }
}
