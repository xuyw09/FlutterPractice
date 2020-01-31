import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollRoute extends StatefulWidget {
  @override
  _ScrollRouteState createState() => new _ScrollRouteState();
}

class _ScrollRouteState extends State<ScrollRoute> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;
  String _progress = "0%";

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dipose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll Controll"),
      ),
      body: Scrollbar(
          // child: ListView.builder(
          //   itemCount: 100,
          //   itemExtent: 80,
          //   controller: _controller,
          //   itemBuilder: (context, index) {
          //     return ListTile(title: Text("$index"));
          //   },
          // ),

          child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                double progress = notification.metrics.pixels /
                    notification.metrics.maxScrollExtent;
                setState(() {
                  _progress = "${(progress * 100).toInt()}%";
                });
                print("BottomEdge: ${notification.metrics.extentAfter == 0}");
              },
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ListView.builder(
                    itemCount: 100,
                    itemExtent: 50,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text("$index"));
                    },
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: Text(_progress),
                    backgroundColor: Colors.black54,
                  )
                ],
              ))),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            ),
    );
  }
}
