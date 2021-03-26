import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularAnimationLab extends StatefulWidget {
  static final routeName = "circularAnimationLab";

  @override
  _CircularAnimationLabState createState() => _CircularAnimationLabState();
}

class _CircularAnimationLabState extends State<CircularAnimationLab>
    with SingleTickerProviderStateMixin {
  double previousPercentage = 0.0;
  double currentPercentage = 0.0;

  final random = Random();

  // Animation
  AnimationController animationController;

  @override
  void initState() {
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 800));

    animationController.addListener(() {
      previousPercentage = lerpDouble(
          previousPercentage, currentPercentage, animationController.value);
      setState(() {});
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
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 200,
          height: 200,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomPaint(
                painter: _CustomProgressPainter(previousPercentage),
              ),
              Center(
                child: Text(
                  "${currentPercentage.toInt().toString()} %",
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        child: Icon(
          Icons.refresh,
        ),
        onPressed: () {
          animationController.forward(from: 0.0);
          if (previousPercentage == 100) {
            previousPercentage = 0;
            currentPercentage = 0;
          } else {
            previousPercentage = currentPercentage;
            currentPercentage += random.nextInt(15) + 1;
            if (currentPercentage > 100) {
              currentPercentage = 100;
              previousPercentage = 100;
            }
          }
          setState(() {});
        },
      ),
    );
  }
}

class _CustomProgressPainter extends CustomPainter {
  // From 0-100
  final double percentToDraw;

  _CustomProgressPainter(this.percentToDraw);

  @override
  void paint(Canvas canvas, Size size) {
    final penForCircle = new Paint()
      ..strokeWidth = 3
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final circleCenter = new Offset(size.width * 0.5, size.height * 0.5);
    /*
    - min -> Retorna el minimo de dos números.
    En este ejemplo usamos el "min" para obtener el menor valor entre el width y el height. Ya que ninguna 
    pantalla es cuadrada. Y con este min evitamos tener un ovalo debido a que el height usualmente es más
    grande que el width en modo portail o el width es mas grande que el height en landscape.
    */
    final double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(circleCenter, radius, penForCircle);

    // Arc

    final penForArc = new Paint()
      ..strokeWidth = 5
      ..color = Colors.amber
      ..style = PaintingStyle.fill;

    double arcAngle = 2 * pi * (percentToDraw / 100);

    canvas.drawArc(
      // Determina un rectangulo imaginario para poder dibujar el arco que deseamos en la posición correcta.
      Rect.fromCircle(center: circleCenter, radius: radius),
      -pi / 2, // Angulo inicial
      arcAngle, // Angulo para dibujar
      // Si es "true" el arco pintado se unirá atravez del centro, como si lo segmentará. Si es false no pasará nada despues de realizar el pintado
      true,
      penForArc,
    );
  }

  @override
  bool shouldRepaint(_CustomProgressPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_CustomProgressPainter oldDelegate) => false;
}
