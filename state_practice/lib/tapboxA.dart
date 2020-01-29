import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key:key);

  @override 
  _TapboxAState createState()=> new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector( 
      onTap: _handleTap,
      child: new Container( 
        child:new Center( 
          child: Text( 
            _active ? 'Active':'InActive',
            style: new TextStyle(fontSize: 32,color: Colors.white)
          ),
        ),
        width: 200,
        height:200,
        decoration: new BoxDecoration( 
          color: _active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      ),
    );
  }
}