import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_designs/widgets/headers.dart';

class EmergencyPage extends StatelessWidget {
  static final routeName = "EmergencyPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HeaderWithIcon(),
    );
  }
}
