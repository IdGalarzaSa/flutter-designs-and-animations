import 'package:flutter/material.dart';

class BoxHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.35,
      color: Colors.amberAccent,
    );
  }
}

class BoxHeaderWithRoundedEdges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.35,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
      ),
    );
  }
}

class DiagonalHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _DiagonalPainter(),
      ),
    );
  }
}

class _DiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pen = new Paint();
    /*
      Style:
      .fill   -> Pinta la figura creada por el path. (Necesita un minimo de 2 lineas)
      .stroke -> Pinta solo las lineas creadas por el path. No pinta la figurá creada.
    */
    pen.style = PaintingStyle.fill;
    pen.color = Colors.green; // Color del lapiz
    pen.strokeWidth = 5.0; // Ancho del lapiz.

    final path = new Path(); // Contiene las instrucciones del dibujo

    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(_DiagonalPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_DiagonalPainter oldDelegate) => false;
}

class TriangleHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(painter: _TrianglePainter()),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pen = Paint();

    pen.color = Colors.brown;
    pen.style = PaintingStyle.fill;
    pen.strokeWidth = 5.0;

    final path = Path();
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(_TrianglePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_TrianglePainter oldDelegate) => false;
}
