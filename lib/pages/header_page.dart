import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_designs/widgets/headers.dart';

class HeaderPage extends StatelessWidget {
  static final routeName = 'headerPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WaveHeaderWithGradient(),
    );
  }
}
