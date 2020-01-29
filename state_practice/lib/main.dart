import 'package:flutter/material.dart';
import 'tapboxA.dart';
import 'tapboxB.dart';
import 'tapboxC.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: MyHomePage(title: 'Flutter Demo Home Page'),
        home: ParentWidget());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  //由parent管理tapboxB的state tapboxB是无状态Widget
  // Widget build(BuildContext context) {
  //   return new Container(
  //       child: new TapboxB(
  //     active: _active,
  //     onChanged: _handleTapboxChanged,
  //   ));
  // }

  /**由tapboxA 自己管理状态 */
  // Widget build(BuildContext context) {
  //   return new Container(
  //     child: new TapboxA(),
  //   );
  // }
  /**混合管理 tapboxC */
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(
      children: <Widget>[
        new TapboxC(
          active: _active,
          onChanged: _handleTapboxChanged,
        ),
        Text(
          "Hello Word!" * 4,
          textScaleFactor: 0.5,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontFamily: "Courier",
              background: new Paint()..color = Colors.yellow,
              decorationStyle: TextDecorationStyle.dotted),
        ),
        Text.rich(TextSpan(children: [
          TextSpan(text: "Home:"),
          TextSpan(
              text: "https://flutterchina.club",
              style: TextStyle(color: Colors.blue))
        ])),
        DefaultTextStyle(
            style: TextStyle(color: Colors.red, fontSize: 20),
            textAlign: TextAlign.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('hello world'),
                Text("I'm Joy"),
                Text(
                  "Nice to meet U",
                  style: TextStyle(inherit: false, color: Colors.grey),
                )
              ],
            ))
      ],
    ));
  }
}
