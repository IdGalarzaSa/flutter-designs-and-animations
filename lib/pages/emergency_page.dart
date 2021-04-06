import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_designs/widgets/headers.dart';
import 'package:flutter_designs/widgets/wide_button_with_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class EmergencyPage extends StatelessWidget {
  static final routeName = "EmergencyPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 200),
            child: _WideButtonList(),
          ),
          _HeaderPage(),
        ],
      ),
    );
  }
}

class _HeaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HeaderWithIcon(
          icon: FontAwesomeIcons.plus,
          subTitle: 'Haz solicitado',
          title: 'Atención Médica',
          headerColor1: Color(0xff526BF6),
          headerColor2: Color(0xff67ACF2),
        ),
        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            shape: CircleBorder(),
            onPressed: () => print("Click ellipsis"),
            child: Icon(FontAwesomeIcons.ellipsisV),
          ),
        ),
      ],
    );
  }
}

class _WideButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 85,
        ),
        FadeInLeft(
          duration: Duration(milliseconds: 250),
          child: WideButtonWithIcon(
            text: 'Motor Accident',
            icon: FontAwesomeIcons.carCrash,
            gradientColor1: Color(0xff6989F5),
            gradientColor2: Color(0xff906EF5),
            onPress: () => print("Click"),
          ),
        ),
        FadeInLeft(
          duration: Duration(milliseconds: 250),
          child: WideButtonWithIcon(
            text: 'Medical Emergency',
            icon: FontAwesomeIcons.plus,
            gradientColor1: Color(0xff66A9F2),
            gradientColor2: Color(0xff536CF6),
            onPress: () => print("Click 2"),
          ),
        ),
        FadeInLeft(
          duration: Duration(milliseconds: 250),
          child: WideButtonWithIcon(
            text: 'Theft / Harrasement',
            icon: FontAwesomeIcons.theaterMasks,
            gradientColor1: Color(0xffF2D572),
            gradientColor2: Color(0xffE06AA3),
            onPress: () => print("Click 3"),
          ),
        ),
        FadeInLeft(
          duration: Duration(milliseconds: 250),
          child: WideButtonWithIcon(
            text: 'Awards',
            icon: FontAwesomeIcons.biking,
            gradientColor1: Color(0xff317183),
            gradientColor2: Color(0xff46997D),
            onPress: () => print("Click 4"),
          ),
        ),
        FadeInLeft(
          child: WideButtonWithIcon(
            text: 'Motor Accident',
            icon: FontAwesomeIcons.carCrash,
            gradientColor1: Color(0xff6989F5),
            gradientColor2: Color(0xff906EF5),
            onPress: () => print("Click"),
          ),
        ),
        FadeInLeft(
          duration: Duration(milliseconds: 250),
          child: WideButtonWithIcon(
            text: 'Medical Emergency',
            icon: FontAwesomeIcons.plus,
            gradientColor1: Color(0xff66A9F2),
            gradientColor2: Color(0xff536CF6),
            onPress: () => print("Click 2"),
          ),
        ),
        FadeInLeft(
          duration: Duration(milliseconds: 250),
          child: WideButtonWithIcon(
            text: 'Theft / Harrasement',
            icon: FontAwesomeIcons.theaterMasks,
            gradientColor1: Color(0xffF2D572),
            gradientColor2: Color(0xffE06AA3),
            onPress: () => print("Click 3"),
          ),
        ),
        FadeInLeft(
          duration: Duration(milliseconds: 250),
          child: WideButtonWithIcon(
            text: 'Awards',
            icon: FontAwesomeIcons.biking,
            gradientColor1: Color(0xff317183),
            gradientColor2: Color(0xff46997D),
            onPress: () => print("Click 4"),
          ),
        ),
        FadeInLeft(
          child: WideButtonWithIcon(
            text: 'Motor Accident',
            icon: FontAwesomeIcons.carCrash,
            gradientColor1: Color(0xff6989F5),
            gradientColor2: Color(0xff906EF5),
            onPress: () => print("Click"),
          ),
        ),
        FadeInLeft(
          duration: Duration(milliseconds: 250),
          child: WideButtonWithIcon(
            text: 'Medical Emergency',
            icon: FontAwesomeIcons.plus,
            gradientColor1: Color(0xff66A9F2),
            gradientColor2: Color(0xff536CF6),
            onPress: () => print("Click 2"),
          ),
        ),
        FadeInLeft(
          duration: Duration(milliseconds: 250),
          child: WideButtonWithIcon(
            text: 'Theft / Harrasement',
            icon: FontAwesomeIcons.theaterMasks,
            gradientColor1: Color(0xffF2D572),
            gradientColor2: Color(0xffE06AA3),
            onPress: () => print("Click 3"),
          ),
        ),
        FadeInLeft(
          duration: Duration(milliseconds: 250),
          child: WideButtonWithIcon(
            text: 'Awards',
            icon: FontAwesomeIcons.biking,
            gradientColor1: Color(0xff317183),
            gradientColor2: Color(0xff46997D),
            onPress: () => print("Click 4"),
          ),
        ),
      ],
    );
  }
}
