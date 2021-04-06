import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WideButtonWithIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color gradientColor1;
  final Color gradientColor2;
  final Function onPress;

  const WideButtonWithIcon({
    this.icon = FontAwesomeIcons.carCrash,
    @required this.text,
    this.gradientColor1 = Colors.grey,
    this.gradientColor2 = Colors.blueGrey,
    @required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: [
          _WideButtonBackground(this.icon, this.gradientColor1, this.gradientColor2),
          Container(
            margin: EdgeInsets.all(45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(this.icon, color: Colors.white, size: 40),
                SizedBox(width: 40),
                Expanded(child: Text(this.text, style: TextStyle(color: Colors.white, fontSize: 18))),
                FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WideButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color gradientColor1;
  final Color gradientColor2;

  const _WideButtonBackground(this.icon, this.gradientColor1, this.gradientColor2);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(icon, size: 150, color: Colors.white.withOpacity(0.2)),
            )
          ],
        ),
      ),
      width: double.infinity,
      margin: EdgeInsets.all(20),
      height: size.height * 0.10,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.white.withOpacity(0.2), offset: Offset(4, 6), blurRadius: 10),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [gradientColor1, gradientColor2],
        ),
      ),
    );
  }
}
