import 'package:flutter/material.dart';
import 'package:flutter_designs/pages/launcher_page.dart';
import 'package:flutter_designs/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return ThemeChanger();
      },
      child: _MainApp(),
    );
  }
}

class _MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Material App',
      initialRoute: LauncherPage.routeName,
      routes: {
        LauncherPage.routeName: (BuildContext context) => LauncherPage(),
      },
      theme: appTheme.currentTheme,
    );
  }
}
