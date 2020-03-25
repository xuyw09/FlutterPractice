import 'package:flutter/material.dart';
import 'package:sigin_in_practice/pages/Widgets/CityPopupMenu.dart';
import 'package:sigin_in_practice/pages/Widgets/UserDrawer.dart';
import 'package:sigin_in_practice/pages/home/home_preview.dart';
import 'package:sigin_in_practice/pages/home/project_list.dart';
import 'package:sigin_in_practice/pages/home/question_answer.dart';
import 'package:sigin_in_practice/pages/sign_in/Signin_page.dart';
import '../../index.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  int _curIndex = 0;
  String curCity; // cityDropdown 选择

  List<Widget> _children = [
    new HomePreview(),
    new ProjectList(),
    new QuestionAnswer()
  ];
  _curCityChanged(city) {
    setState(() {
      curCity = city;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
    if (!userModel.isLogin) {
      return Scaffold(body: SignInPage());
    } else {
      return Scaffold(
        appBar: _appBar(),
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
            setState(() {
              _curIndex = index;
            });
          },
        ),
      );
    }
  }

  Widget _appBar() {
    switch (_curIndex) {
      case 0:
        return AppBar(title: Text('HappyToAnswer'));
      case 1:
        return AppBar(
            title: Text(curCity != null ? '${curCity}项目列表' : '项目列表'),
            actions: <Widget>[
              CityPopupMenu(
                  curCityChanged: (curCity) => _curCityChanged(curCity))
            ]);
      case 2:
        return AppBar(title: Text('技术问答'));
      default:
        return AppBar(title: Text('HappyToAnswer'));
    }
  }
}
