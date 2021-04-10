import 'package:flutter/material.dart';
import 'package:flutter_designs/pages/launcher_page.dart';
import 'package:flutter_designs/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return ThemeChanger();
      },
      child: MaterialApp(
        title: 'Material App',
        initialRoute: LauncherPage.routeName,
        routes: {
          LauncherPage.routeName: (BuildContext context) => LauncherPage(),
        },
        theme: ThemeData.dark(),
      ),
    );
  }
}
