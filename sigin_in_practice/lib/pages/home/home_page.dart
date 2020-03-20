import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigin_in_practice/models/index.dart';
import 'package:sigin_in_practice/states/curuser_change_notifier.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  Future getProjects() async {
    Dio _dio = new Dio();
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _dio.options.baseUrl = 'http://10.0.2.2:3020';
    // devLoginUrl: 'http://10.0.2.2:3900'
    // distloginUrl: 'https://sso.ce-safe.com'

    //添加拦截器
    _dio.interceptors
      ..add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        print("interceptors");
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        var userJson = _prefs.getString('curUser');
        print("****preferences***");
        print(userJson);
        if (userJson != null && userJson.isNotEmpty) {
          User user = User.fromJson(jsonDecode(userJson));
          options.headers = {
            'cookie': "userName=${user.userName};",
            'cookie': 'uid=${user.uid};'
          };
        }
        return options;
      }))
      ..add(LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
    print("----getcities-----");
    print(_dio.options.headers);
    Response response = await _dio.get("/api/meta/cities");
    print(response);
    print(response.data);
    print('*****get cities****');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HappyToAnswer'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    UserModel userModel = Provider.of<UserModel>(context);
    print("*****home*****");
    print(userModel.user?.userName);
    print(userModel.isLogin);
    if (!userModel.isLogin) {
      return Center(
        child: RaisedButton(
          child: Text('暂时未登录请先登录'),
          onPressed: () => Navigator.of(context).pushNamed('signin'),
        ),
      );
    } else {
      return Column(
        children: <Widget>[
          Text(
            "欢迎你${userModel.user.realName}",
            style: TextStyle(fontSize: 20, color: Colors.pink),
          ),
          Image.network("${userModel.user.avatar}", width: 50.0),
          Text("公司${userModel.user.corporation}"),
          RaisedButton(
            child: Text('退出登录'),
            onPressed: () {
              userModel.user = null;
              // Navigator.pop(context);
              Navigator.of(context).pushNamed('signin');
            },
          ),
          RaisedButton(
            child: Text('获取城市列表'),
            onPressed: () {
              getProjects();
            },
          )
        ],
      );
    }
  }
}
