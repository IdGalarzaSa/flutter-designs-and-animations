import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  static final routeName = "SlideshowPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: _Slides()),
      ),
    );
  }
}

class _Slides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: [
          _Slide('lib/assets/svgs/slide-1.svg'),
          _Slide('lib/assets/svgs/slide-2.svg'),
          _Slide('lib/assets/svgs/slide-3.svg'),
          _Slide('lib/assets/svgs/slide-4.svg'),
          _Slide('lib/assets/svgs/slide-5.svg'),
        ],
      ),
    );
  }
}

// This widget was created to avoid the margin o padding
class _Slide extends StatelessWidget {
  final String svgName;

  _Slide(this.svgName);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: SvgPicture.asset(svgName),
    );
  }
}
