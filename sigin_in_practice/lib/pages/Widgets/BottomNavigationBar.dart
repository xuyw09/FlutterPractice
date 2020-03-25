import 'package:flutter/material.dart';
import '../../index.dart';

class BottomNavigation extends StatefulWidget {
  final curIndexChanged;
  final curIndex;
  const BottomNavigation({Key key, this.curIndexChanged,this.curIndex}) : super(key: key);
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        currentIndex: widget.curIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            title: Text('项目'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), title: Text('问答'))
        ],
        onTap: (value) {
          setState(() {
            widget.curIndexChanged(value);
          });
        },
      ),
    );
  }
}
