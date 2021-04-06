import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WideButtonWithIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _WideButtonBackground();
  }
}

class _WideButtonBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      height: size.height * 0.10,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.white.withOpacity(0.2), offset: Offset(4, 6), blurRadius: 10),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [Color(0xff6989F5), Color(0xff906EF5)],
        ),
      ),
    );
  }
}
