import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_designs/widgets/headers.dart';
import 'package:flutter_designs/widgets/wide_button_with_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  static final routeName = "EmergencyPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: WideButtonWithIcon()),
    );
  }
}

class _HeaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HeaderWithIcon(
      icon: FontAwesomeIcons.plus,
      subTitle: 'Haz solicitado',
      title: 'Atención Médica',
      headerColor1: Color(0xff526BF6),
      headerColor2: Color(0xff67ACF2),
    );
  }
}
