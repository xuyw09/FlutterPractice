import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GestureDetectorTestRoute extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() =>
      new _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {
  String _opertation = "No Gesture detected!";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 300,
            height: 500,
            child: Text(_opertation, style: TextStyle(color: Colors.white)),
          ),
          onTap: () => updateText('Tap'),
          onDoubleTap: () => updateText('DoubleTap'),
          onLongPress: () => updateText('LongPress')),
    );
  }

  void updateText(String text) {
    setState(() {
      _opertation = text;
    });
  }
}
