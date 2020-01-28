import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "new_page": (context) => NewRoute(),
        // "echo_page": (context) => EchoRote(),
        "tip2": (context) => TipRoute(
              text: ModalRoute.of(context).settings.arguments,
            ),
        "Echo": (context) => Echo(
              text: "hello world",
            ),
        "contextRoute": (context) => ContextRoute(),
        "statefulRoute": (context) => CounterWidget()
        // "/":(context) => MyHomePage(title: 'Flutter Demo',)
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
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
            FlatButton(
              child: new Text("Open New Route"),
              textColor: Colors.blue,
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return NewRoute();
                // }));
                Navigator.pushNamed(context, "new_page");
              },
            ),
            FlatButton(
              child: Text("Echo"),
              textColor: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, "Echo");
              },
            ),
            FlatButton(
              child: Text("Context Route"),
              textColor: Colors.deepOrange,
              onPressed: () {
                Navigator.pushNamed(context, "contextRoute");
              },
            ),
            FlatButton(
              child: Text("Stateful Life Circle"),
              textColor: Colors.indigo,
              onPressed: () {
                Navigator.pushNamed(context, "statefulRoute");
              },
            ),
            RaisedButton(
              onPressed: () {
                print(context);
                ScaffoldState _state = Scaffold.of(context); //获取为null 有问题
                print(_state);
                _state.showSnackBar(SnackBar(
                  content: Text("I'm SanckBar"),
                ));
              },
              child: Text("Show SnackBar"),
            )
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

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('New Route'),
      ),
      body: Center(
        child: new Text("This id new route"),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("提示"),
        ),
        body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
              child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                  onPressed: () => Navigator.pop(context, "我是返回值"),
                  child: Text("返回"))
            ],
          )),
        ));
  }
}

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: RaisedButton(
            onPressed: () async {
              var result = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return TipRoute(text: "我是提示xxx");
              }));
              print("路由的返回值：$result");
            },
            child: Text("打开提示页")));
  }
}

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    return Center(
      child: Text(args),
    );
  }
}

class Echo extends StatelessWidget {
  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor: Colors.grey,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}

class ContextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("context test"),
        ),
        body: Container(
          child: Builder(
            builder: (context) {
              Scaffold scaffold = context.findAncestorWidgetOfExactType();
              return (scaffold.appBar as AppBar).title;
            },
          ),
        ));
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initValue: 0});

  final int initValue;
  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();

    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
        appBar: AppBar(title: Text("stateful widget")),
        body: Center(
          child: FlatButton(
            child: Text('$_counter'),
            onPressed: () => setState(() => ++_counter),
          ),
        ));
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("did update widget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("dispose");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("ressemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
