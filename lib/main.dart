import 'package:flutter/material.dart';
import 'package:flutter_designs/challengs/animation_challenge_page.dart';
import 'package:flutter_designs/pages/animations_page.dart';
import 'package:flutter_designs/pages/header_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: AnimationChallengePage.routeName,
      routes: {
        HeaderPage.routeName: (BuildContext context) => HeaderPage(),
        AnimationsPage.routeName: (BuildContext context) => AnimationsPage(),
        AnimationChallengePage.routeName: (BuildContext context) =>
            AnimationChallengePage(),
      },
      theme: ThemeData.dark(),
    );
  }
}
