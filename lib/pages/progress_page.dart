import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_designs/widgets/circular_progress_widget.dart';

class ProgressPage extends StatefulWidget {
  static final routeName = "ProgressPage";

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  var percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          percentage += 10;
          if (percentage > 100) {
            percentage = 0;
          }
          setState(() {});
        },
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: CircularProgressWidget(
            percentage: percentage,
          ),
        ),
        // child: Text('$percentage %', style: TextStyle(fontSize: 50)),
      ),
    );
  }
}
