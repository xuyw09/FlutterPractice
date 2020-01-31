import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MyDrawer.dart';

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => new _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute>
    with SingleTickerProviderStateMixin {
  //TapBar
  TabController tabController;
  List tabs = ["News", "History", "Image"];
  @override
  void initState() {
    tabController = TabController(length: tabs.length, vsync: this)
      ..addListener(() {
        var index = tabController.index;
        var preIndex = tabController.previousIndex;
        print("current Index: $index");
        print("previous Index: $preIndex");
      });
    super.initState();
  }

  //bottomNavigation
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Name"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {})
        ],
        bottom: TabBar(
            controller: tabController,
            tabs: tabs
                .map((e) => Tab(
                      text: e,
                    ))
                .toList()),
      ),
      body: TabBarView(
          controller: tabController,
          children: tabs.map((e) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                e,
                textScaleFactor: 3,
              ),
            );
          }).toList()),
      drawer: new MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Bussiness')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School'))
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
    );
  }
}
