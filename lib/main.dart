import 'package:flutter/material.dart';
import 'package:flutter_designs/pages/launcher_page.dart';
import 'package:flutter_designs/pages/launcher_tablet_page.dart';
import 'package:flutter_designs/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (BuildContext context) => new ThemeChanger(2),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      title: 'Designs App',
      theme: appTheme.currentTheme,
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final size = MediaQuery.of(context).size;

          return size.width > 500 ? LauncherTabletPage() : LauncherPage();
        },
      ),
    );
  }
}
