import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_designs/routes/routes.dart';
import 'package:flutter_designs/theme/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  static final String routeName = 'LauncherPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Diseños flutter')),
      drawer: _Drawer(),
      body: _DesignList(),
    );
  }
}

class _Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: [
            _headerDrawer(),
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
        leading: Icon(Icons.lightbulb_outline, color: Colors.blue),
        title: Text('Custom Theme'),
        trailing: Switch.adaptive(
          value: appTheme.customTheme,
          onChanged: (newValue) => appTheme.customTheme = newValue,
          activeColor: Colors.blue,
        ),
      ),
    );
  }

  ListTile _darkThemeListTile(ThemeChanger appTheme) {
    return ListTile(
      leading: Icon(Icons.lightbulb_outline, color: Colors.blue),
      title: Text('Dark mode'),
      trailing: Switch.adaptive(
        value: appTheme.dartTheme,
        onChanged: (newValue) => appTheme.dartTheme = newValue,
        activeColor: Colors.blue,
      ),
    );
  }

  Widget _headerDrawer() {
    return Container(
        padding: EdgeInsets.all(20),
        height: 100,
        width: double.infinity,
        color: Colors.amber,
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
    return ListView.separated(
      itemCount: pageRoutes.length,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: Colors.blue,
      ),
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: FaIcon(pageRoutes[index].icon, color: Colors.blue),
        title: Text(pageRoutes[index].title),
        trailing: Icon(Icons.chevron_right, color: Colors.blue),
        onTap: () {
          Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => pageRoutes[index].page));
        },
      ),
    );
  }
}
