import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRecognizer extends StatefulWidget {
  @override
  _GestureRecognizerState createState() => new _GestureRecognizerState();
}

class _GestureRecognizerState extends State<GestureRecognizer> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false;

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: "你好世界"),
        TextSpan(
            text: '点我变色',
            style: TextStyle(
                fontSize: 30, color: _toggle ? Colors.blue : Colors.red),
            recognizer: _tapGestureRecognizer
              ..onTap = () {
                setState(() {
                  _toggle = !_toggle;
                });
              }),
        TextSpan(text: "你好世界！")
      ])),
    );
  }
}
