import 'package:flutter/material.dart';
import 'package:sigin_in_practice/pages/Widgets/BottomNavigationBar.dart';
import 'package:sigin_in_practice/pages/Widgets/UserDrawer.dart';
import 'package:sigin_in_practice/pages/home/home_preview.dart';
import 'package:sigin_in_practice/pages/home/project_list.dart';
import 'package:sigin_in_practice/pages/home/question_answer.dart';
import 'package:sigin_in_practice/pages/sign_in/Signin_page.dart';
import 'package:sigin_in_practice/states/curCity_change_notifier.dart';
import '../../index.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  final List<String> cities = ['上海', '南京'];
  String _currentCity = '上海';
  int _curIndex = 0;
  Widget dropdownWidget() {
    return DropdownButton(
        items: cities
            .map((c) => DropdownMenuItem(child: Text(c), value: c))
            .toList(),
        onChanged: (String value) {
          setState(() {
            _currentCity = value;
          });
        },
        value: cities.first);
  }

  List<Widget> _children = [
    new HomePreview(),
    new ProjectList(),
    new QuestionAnswer()
  ];

  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
    if (!userModel.isLogin) {
      return Scaffold(body: SignInPage());
    } else {
      return Scaffold(
        appBar: AppBar(
            title: Text('HappyToAnswer'), actions: <Widget>[dropdownWidget()]),
        body: _children[_curIndex],
        drawer: new UserDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _curIndex,
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
          onTap: (index) {
            print(index);
            setState(() {
              _curIndex = index;
            });
          },
        ),
      );
    }
  }

  Widget _buildBody() {
    CityModel cityModel = Provider.of<CityModel>(context);
    return Column(
      children: <Widget>[
        Text(
          "欢迎你",
          style: TextStyle(fontSize: 20, color: Colors.pink),
        ),
        RaisedButton(
          child: Text('获取城市列表'),
          onPressed: () {
            //获取城市列表
          },
        )
      ],
    );
  }
}
