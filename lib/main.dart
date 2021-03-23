import 'package:flutter/material.dart';
import 'package:flutter_designs/pages/header_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: HeaderPage.routeName,
      routes: {
        HeaderPage.routeName: (BuildContext context) => HeaderPage(),
      },
      theme: ThemeData.dark(),
    );
  }
}
