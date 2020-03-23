import 'package:flutter/material.dart';
import 'package:sigin_in_practice/pages/Widgets/UserDraw.dart';
import 'package:sigin_in_practice/pages/sign_in/Signin_page.dart';
import '../../index.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  final List<String> cities = ['上海', '南京'];
  String _currentCity = '上海';
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

  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
    if (!userModel.isLogin) {
      return Scaffold(body: SignInPage());
    } else {
      return Scaffold(
        appBar: AppBar(
            title: Text('HappyToAnswer'), actions: <Widget>[dropdownWidget()]),
        body: _buildBody(),
        drawer: new UserDrawer(),
      );
    }
  }

  Widget _buildBody() {
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
