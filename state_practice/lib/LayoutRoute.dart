import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("布局示例"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min, // size为min时，对齐无效
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Hello world"),
              Text("I am HappyJoy"),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            // textDirection: TextDirection.rtl,
            children: <Widget>[
              Text("Hello world"),
              Text("I am HappyJoy"),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text("Hello world"),
              Text("I am HappyJoy"),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text("Hello world"),
              Text(
                "I am HappyJoy",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[Text("Hello"), Text("HappyJoy")],
          ),
          Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    child: Column(
                      children: <Widget>[Text("Hello"), Text("HappyJoy")],
                    ),
                  )
                ],
              ),
            ),
          ),

          //Flex
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 20,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 20,
                  color: Colors.blue,
                ),
              )
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 30,
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 10,
                        color: Colors.indigo,
                      ),
                    ),
                    Spacer(flex: 1),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 10,
                        color: Colors.orange,
                      ),
                    )
                  ],
                ),
              )),

          // wrap 布局
          Wrap(
            spacing: 8,
            runSpacing: 4,
            alignment: WrapAlignment.center,
            children: <Widget>[
              new Chip(
                avatar: new CircleAvatar(
                    backgroundColor: Colors.purple, child: Text("A")),
                label: new Text("Xuyw"),
              ),
              new Chip(
                avatar: new CircleAvatar(
                    backgroundColor: Colors.purple, child: Text("M")),
                label: new Text("HappyJoy"),
              ),
              new Chip(
                avatar: new CircleAvatar(
                    backgroundColor: Colors.purple, child: Text("H")),
                label: new Text("Xuyw1992"),
              ),
              new Chip(
                avatar: new CircleAvatar(
                    backgroundColor: Colors.purple, child: Text("J")),
                label: new Text("Xuyw++"),
              ),
            ],
          ),

          //stack and positioned
          // ConstrainedBox(
          //   constraints: BoxConstraints.expand(),
          //   child: Stack(
          //     alignment: Alignment.center,
          //     children: <Widget>[
          //       Container(
          //           child: Text(
          //             "Hello world",
          //             style: TextStyle(color: Colors.purple),
          //           ),
          //           color: Colors.grey),
          //       Positioned(
          //         left: 18,
          //         child: Text("I'm Joy"),
          //       ),
          //       Positioned(
          //         top: 50,
          //         child: Text('Ur friend'),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
