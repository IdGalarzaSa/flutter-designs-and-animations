import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CircularProgressWidget extends StatefulWidget {
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;

  CircularProgressWidget({
    @required this.percentage,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
  });

  @override
  _CircularProgressWidgetState createState() => _CircularProgressWidgetState();
}

class _CircularProgressWidgetState extends State<CircularProgressWidget> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  double previousPercentage;

  @override
  void initState() {
    // Al ser la primera vez asignamos el primer valor al previouse percentage
    previousPercentage = widget.percentage;

    animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward(from: 0);

    final pendingAnimation = widget.percentage - previousPercentage;
    previousPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(10),
          child: CustomPaint(
            painter: _CustomProgressPainter(
              (widget.percentage - pendingAnimation) + (pendingAnimation * animationController.value),
              widget.primaryColor,
              widget.secondaryColor,
            ),
          ),
        );
      },
    );
  }
}

class _CustomProgressPainter extends CustomPainter {
  // From 0-100
  final double percentToDraw;
  final Color primaryColor;
  final Color secondaryColor;

  _CustomProgressPainter(this.percentToDraw, this.primaryColor, this.secondaryColor);

  @override
  void paint(Canvas canvas, Size size) {
    final penForCircle = new Paint()
      ..strokeWidth = 3
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final circleCenter = new Offset(size.width * 0.5, size.height * 0.5);

    final double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(circleCenter, radius, penForCircle);

    // Arc
    final penForArc = new Paint()
      ..strokeWidth = 5
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percentToDraw / 100);

    canvas.drawArc(
      // Determina un rectangulo imaginario para poder dibujar el arco que deseamos en la posición correcta.
      Rect.fromCircle(center: circleCenter, radius: radius),
      -pi / 2, // Angulo inicial
      arcAngle, // Angulo para dibujar
      false,
      penForArc,
    );
  }

  @override
  bool shouldRepaint(_CustomProgressPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_CustomProgressPainter oldDelegate) => false;
}
