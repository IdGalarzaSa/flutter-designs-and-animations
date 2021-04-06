import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

    pen.color = Colors.deepOrangeAccent;
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

class PeakHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(painter: _PeakPainter()),
    );
  }
}

class _PeakPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pen = Paint();

    pen.color = Colors.brown;
    pen.style = PaintingStyle.fill;
    pen.strokeWidth = 5.0;

    final path = Path();
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.32);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(_PeakPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_PeakPainter oldDelegate) => false;
}

class CurvedUpHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(painter: _CurvedUpPainter()),
    );
  }
}

class _CurvedUpPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pen = Paint();

    pen.color = Colors.red;
    pen.style = PaintingStyle.fill;
    pen.strokeWidth = 5.0;

    final path = Path();
    /*
      "quadraticBezierTo" Nos permite hacer una curva definiendo un punto
      por donde deseamos que pase la curva y un punto final de la curva.

      Nota: El punto inial de la curva es el punto previo. 

      x1, y1 -> Es el punto por donde deseamos que pase la curvatura.
      x2, y2 -> Es el punto final de la curvatura.

    */

    path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.20, size.width, size.height * 0.30);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(_CurvedUpPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_CurvedUpPainter oldDelegate) => false;
}

class CurvedDownHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(painter: _CurvedDownPainter()),
    );
  }
}

class _CurvedDownPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pen = Paint();

    pen.color = Colors.pink;
    pen.style = PaintingStyle.fill;
    pen.strokeWidth = 5.0;

    final path = Path();
    /*
      "quadraticBezierTo" Nos permite hacer una curva definiendo un punto
      por donde deseamos que pase la curva y un punto final de la curva.

      Nota: El punto inial de la curva es el punto previo. 

      x1, y1 -> Es el punto por donde deseamos que pase la curvatura.
      x2, y2 -> Es el punto final de la curvatura.

    */

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.35, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(_CurvedDownPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_CurvedDownPainter oldDelegate) => false;
}

class WaveHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(painter: _WavePainter()),
    );
  }
}

class _WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pen = Paint();

    pen.color = Colors.teal;
    pen.style = PaintingStyle.fill;
    pen.strokeWidth = 5.0;

    final path = Path();

    path.lineTo(0, size.height * 0.25);

    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.25);

    path.quadraticBezierTo(size.width * 0.75, size.height * 0.15, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(_WavePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_WavePainter oldDelegate) => false;
}

class WaveHeaderWithGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(painter: _WaveWithGradientPainter()),
    );
  }
}

class _WaveWithGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(colors: [
      Color(0xff6D05E8),
      Color(0xffC012FF),
      Color(0xff6D05FA),
    ]);

    final Rect rect = new Rect.fromCircle(center: Offset(150.0, 225.0), radius: 200);

    final pen = Paint()..shader = gradient.createShader(rect);

    pen.color = Colors.lime;
    pen.style = PaintingStyle.fill;
    pen.strokeWidth = 5.0;

    final path = Path();

    path.lineTo(0, size.height * 0.25);

    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.25);

    path.quadraticBezierTo(size.width * 0.75, size.height * 0.15, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(_WaveWithGradientPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_WaveWithGradientPainter oldDelegate) => false;
}

class HeaderWithIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final Color whiteTextColor = Colors.white.withOpacity(0.7);

    return Stack(
      children: [
        _HeaderWithIconBackground(screenSize: screenSize),
        Positioned(
          left: -70,
          top: -50,
          child: FaIcon(FontAwesomeIcons.plus, size: 250, color: Colors.white.withOpacity(0.2)),
        ),
        Column(
          children: [
            SizedBox(height: 80, width: double.infinity),
            Text("Haz solicitado", style: TextStyle(fontSize: 20, color: whiteTextColor)),
            SizedBox(height: 20),
            Text("Asistencia Médica",
                style: TextStyle(fontSize: 25, color: whiteTextColor, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            FaIcon(FontAwesomeIcons.plus, size: 80, color: Colors.white),
          ],
        )
      ],
    );
  }
}

class _HeaderWithIconBackground extends StatelessWidget {
  final Size screenSize;

  _HeaderWithIconBackground({@required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenSize.height * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(65)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff526BF6),
            Color(0xff67ACF2),
          ],
        ),
      ),
    );
  }
}
