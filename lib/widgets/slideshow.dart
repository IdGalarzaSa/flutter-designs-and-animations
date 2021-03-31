import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideshowWidget extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsDown;
  final Color primaryColor;
  final Color secondaryColor;
  final bool circularDots;
  final double selectedDotSize;
  final double unselectedDotSize;

  SlideshowWidget({
    @required this.slides,
    this.dotsDown = true,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.circularDots = true,
    this.selectedDotSize = 12,
    this.unselectedDotSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideshowModel>(context).primaryColor = this.primaryColor;
              Provider.of<_SlideshowModel>(context).secondaryColor = this.secondaryColor;
              Provider.of<_SlideshowModel>(context).circularDots = this.circularDots;
              Provider.of<_SlideshowModel>(context).selectedDotSize = this.selectedDotSize;
              Provider.of<_SlideshowModel>(context).unselectedDotSize = this.unselectedDotSize;
              return _SlideshowStruct(dotsDown: dotsDown, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _SlideshowStruct extends StatelessWidget {
  const _SlideshowStruct({
    Key key,
    @required this.dotsDown,
    @required this.slides,
  }) : super(key: key);

  final bool dotsDown;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    final bool circularDots = Provider.of<_SlideshowModel>(context).circularDots;

    return Column(
      children: [
        if (!dotsDown) _Dots(slides.length, circularDots),
        Expanded(child: _Slides(slides)),
        if (dotsDown) _Dots(slides.length, circularDots),
      ],
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slideList;

  _Slides(this.slideList);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page;
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
          children: widget.slideList.map((slide) => new _Slide(slide)).toList()),
    );
  }
}

// This widget was created to avoid the margin o padding
class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

// Dots
class _Dots extends StatelessWidget {
  final int dotsNumber;
  final bool circularDot;
  _Dots(this.dotsNumber, this.circularDot);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            dotsNumber, (index) => circularDot ? _SingleCircularDot(index) : _SingleRectangularDot(index)),
      ),
    );
  }
}

class _SingleCircularDot extends StatelessWidget {
  final index;
  _SingleCircularDot(this.index);

  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlideshowModel>(context);

    double size;
    Color currentColor;

    if (slideshowModel.currentPage >= index - 0.5 && slideshowModel.currentPage < index + 0.5) {
      currentColor = slideshowModel.primaryColor;
      size = slideshowModel.selectedDotSize;
    } else {
      currentColor = slideshowModel.secondaryColor;
      size = slideshowModel.unselectedDotSize;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: size,
      height: size,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: currentColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _SingleRectangularDot extends StatelessWidget {
  final index;
  _SingleRectangularDot(this.index);

  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlideshowModel>(context);

    double size;
    Color currentColor;

    if (slideshowModel.currentPage >= index - 0.5 && slideshowModel.currentPage < index + 0.5) {
      currentColor = slideshowModel.primaryColor;
      size = slideshowModel.selectedDotSize;
    } else {
      currentColor = slideshowModel.secondaryColor;
      size = slideshowModel.unselectedDotSize;
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: size,
      height: size / 3,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: currentColor,
        shape: BoxShape.rectangle,
      ),
    );
  }
}

/*=========================================
                MODEL
=========================================*/

class _SlideshowModel extends ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  bool _circularDots = true;
  double _selectedDotSize = 12;
  double _unselectedDotSize = 12;

  double get currentPage => this._currentPage;

  set currentPage(double newPage) {
    this._currentPage = newPage;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;

  set primaryColor(Color newColor) {
    this._primaryColor = newColor;
  }

  Color get secondaryColor => this._secondaryColor;

  set secondaryColor(Color newColor) {
    this._secondaryColor = newColor;
  }

  bool get circularDots => this._circularDots;

  set circularDots(bool isCircular) {
    this._circularDots = isCircular;
  }

  double get selectedDotSize => this._selectedDotSize;

  set selectedDotSize(double newSelectedDotSize) {
    this._selectedDotSize = newSelectedDotSize;
  }

  double get unselectedDotSize => this._unselectedDotSize;

  set unselectedDotSize(double newUnselectedDotSize) {
    this._unselectedDotSize = newUnselectedDotSize;
  }
}
