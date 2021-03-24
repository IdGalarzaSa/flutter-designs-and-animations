import 'dart:math' as Math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_designs/widgets/box.dart';

class AnimationsPage extends StatelessWidget {
  static final routeName = "animationsPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBox(),
      ),
    );
  }
}

class AnimatedBox extends StatefulWidget {
  @override
  _AnimatedBoxState createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox>
    with SingleTickerProviderStateMixin {
  AnimationController animationController; // Controlador de la animación
  Animation<double> rotation;
  Animation<double> opacity;
  Animation<double> rightMove;
  Animation<double> downMove;
  Animation<double> scale; // Animación que deseamos

  @override
  void initState() {
    animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    rotation = Tween(begin: 0.0, end: 3 * Math.pi).animate(
        CurvedAnimation(parent: animationController, curve: Curves.elasticOut));

    opacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 0.25, curve: Curves.easeOut)));

    rightMove = Tween(begin: 0.0, end: 200.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    downMove = Tween(begin: 0.0, end: 500.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    scale = Tween(begin: 0.0, end: 5.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (animationController.status == AnimationStatus.dismissed) {
        animationController.forward();
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
    // Play / Inicio de la animación.
    animationController.forward();

    return AnimatedBuilder(
      animation: animationController, // El controlador
      child: Box(),
      builder: (BuildContext context, Widget box) {
        return Transform.translate(
          offset: Offset(rightMove.value, downMove.value),
          child: Transform.rotate(
            angle: rotation.value,
            child: Transform.scale(
              scale: scale.value,
              child: Opacity(
                child: box,
                opacity: opacity.value,
              ),
            ),
          ),
        );
      },
    );
  }
}
