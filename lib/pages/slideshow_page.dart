import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_designs/widgets/slideshow_widget.dart';
import 'package:flutter_svg/svg.dart';

class SlideshowPage extends StatelessWidget {
  static final routeName = "SlideshowPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_SlideshowWidgetWithCircularDots(), _SlideshowWidgetWithRectangularDots()],
      ),
    );
  }
}

class _SlideshowWidgetWithCircularDots extends StatelessWidget {
  const _SlideshowWidgetWithCircularDots({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SlideshowWidget(
        primaryColor: Colors.pink,
        secondaryColor: Colors.deepPurple,
        selectedDotSize: 20,
        unselectedDotSize: 5,
        slides: [
          SvgPicture.asset('lib/assets/svgs/slide-1.svg'),
          SvgPicture.asset('lib/assets/svgs/slide-2.svg'),
          SvgPicture.asset('lib/assets/svgs/slide-3.svg'),
          SvgPicture.asset('lib/assets/svgs/slide-4.svg'),
          SvgPicture.asset('lib/assets/svgs/slide-5.svg'),
        ],
      ),
    );
  }
}

class _SlideshowWidgetWithRectangularDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SlideshowWidget(
        circularDots: false,
        primaryColor: Colors.red,
        secondaryColor: Colors.teal,
        selectedDotSize: 30,
        unselectedDotSize: 10,
        slides: [
          SvgPicture.asset('lib/assets/svgs/slide-1.svg'),
          SvgPicture.asset('lib/assets/svgs/slide-2.svg'),
          SvgPicture.asset('lib/assets/svgs/slide-3.svg'),
          SvgPicture.asset('lib/assets/svgs/slide-4.svg'),
          SvgPicture.asset('lib/assets/svgs/slide-5.svg'),
        ],
      ),
    );
  }
}
