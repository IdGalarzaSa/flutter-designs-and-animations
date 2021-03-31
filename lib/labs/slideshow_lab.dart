import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_designs/models/slider_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowLab extends StatelessWidget {
  static final routeName = "SlideshowLab";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(child: _Slides()),
              _Dots(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      print("Pagina actuail ${pageViewController.page}");
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        scrollDirection: Axis.horizontal,
        controller: pageViewController,
        children: [
          _Slide('lib/assets/svgs/slide-1.svg'),
          _Slide('lib/assets/svgs/slide-2.svg'),
          _Slide('lib/assets/svgs/slide-3.svg'),
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

// Dots
class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _SingleDot(0),
          _SingleDot(1),
          _SingleDot(2),
        ],
      ),
    );
  }
}

class _SingleDot extends StatelessWidget {
  final index;

  _SingleDot(this.index);

  @override
  Widget build(BuildContext context) {
    final currentPageView = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (currentPageView >= index - 0.5 && currentPageView < index + 0.5) ? Colors.red : Colors.blueGrey,
        shape: BoxShape.circle,
      ),
    );
  }
}
