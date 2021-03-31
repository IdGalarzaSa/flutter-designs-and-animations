import 'package:flutter/material.dart';
import 'package:flutter_designs/challengs/animation_challenge_page.dart';
import 'package:flutter_designs/pages/animations_page.dart';
import 'package:flutter_designs/labs/circular_animation_lab.dart';
import 'package:flutter_designs/pages/header_page.dart';
import 'package:flutter_designs/pages/progress_page.dart';
import 'package:flutter_designs/labs/slideshow_lab.dart';
import 'package:flutter_designs/pages/slideshow_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: SlideshowPage.routeName,
      routes: {
        HeaderPage.routeName: (BuildContext context) => HeaderPage(),
        AnimationsPage.routeName: (BuildContext context) => AnimationsPage(),
        AnimationChallengePage.routeName: (BuildContext context) => AnimationChallengePage(),
        CircularAnimationLab.routeName: (BuildContext context) => CircularAnimationLab(),
        ProgressPage.routeName: (BuildContext context) => ProgressPage(),
        SlideshowLab.routeName: (BuildContext context) => SlideshowLab(),
        SlideshowPage.routeName: (BuildContext context) => SlideshowPage(),
      },
      theme: ThemeData.dark(),
    );
  }
}
