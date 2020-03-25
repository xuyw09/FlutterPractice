import 'package:flutter/material.dart';
import 'package:sigin_in_practice/pages/Widgets/BottomNavigationBar.dart';
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

  _curIndexChanged(index) {
    setState(() {
      _curIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
    if (!userModel.isLogin) {
      return Scaffold(body: SignInPage());
    } else {
      return Scaffold(
        appBar: _appBar(_curIndex),
        body: _children[_curIndex],
        drawer: new UserDrawer(),
        bottomNavigationBar: BottomNavigation(
          curIndex: _curIndex,
          curIndexChanged: (curIndex) => _curIndexChanged(curIndex),
        ),
      );
    }
  }

  Widget _appBar(index) {
    switch (index) {
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
