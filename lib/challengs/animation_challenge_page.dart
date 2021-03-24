import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_designs/widgets/box.dart';

class AnimationChallengePage extends StatefulWidget {
  static final routeName = "animationChallengePage";

  @override
  _AnimationChallengeState createState() => _AnimationChallengeState();
}

class _AnimationChallengeState extends State<AnimationChallengePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> rightAnimation;
  Animation<double> upAnimation;
  Animation<double> leftAnimation;
  Animation<double> downAnimation;

  @override
  void initState() {
    animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 4));

    rightAnimation = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0, 0.25, curve: Curves.bounceOut),
    ));

    upAnimation = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.25, 0.50, curve: Curves.bounceOut),
    ));

    leftAnimation = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.50, 0.75, curve: Curves.bounceOut),
    ));

    downAnimation = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.75, 1.0, curve: Curves.bounceOut),
    ));

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        animationController.repeat();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();

    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          child: Box(),
          builder: (BuildContext context, Widget child) {
            return Transform.translate(
              offset: Offset(rightAnimation.value + leftAnimation.value,
                  upAnimation.value + downAnimation.value),
              child: child,
            );
          },
        ),
      ),
    );
  }
}
