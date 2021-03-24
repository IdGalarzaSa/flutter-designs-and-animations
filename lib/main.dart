import 'package:flutter/material.dart';
import 'package:flutter_designs/pages/animations_page.dart';
import 'package:flutter_designs/pages/header_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: AnimationsPage.routeName,
      routes: {
        HeaderPage.routeName: (BuildContext context) => HeaderPage(),
        AnimationsPage.routeName: (BuildContext context) => AnimationsPage(),
      },
      theme: ThemeData.dark(),
    );
  }
}
