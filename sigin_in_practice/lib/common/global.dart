import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigin_in_practice/common/http/HttpUtils.dart';
import 'dart:convert';

import '../models/user.dart';

class Global {
  static SharedPreferences _prefs;
  static User curUser = User();

  //初始化全局信息
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    _prefs = await SharedPreferences.getInstance();
    var _curUser = _prefs.getString("curUser");

    if (_curUser != null) {
      try {
        curUser = User.fromJson(jsonDecode(_curUser));
      } catch (e) {
        print('-----global init function error:' + e);
      }
    }

    //初始化网络请求
    HttpUtils.init();
  }

  // 持久化curUser信息
  static saveCurUser(user) {
    print('global save');
    if (user == null) {
      _prefs.setString('curUser', user);
      _prefs.clear();
    }
    _prefs.setString('curUser', jsonEncode(curUser.toJson()));
  }
}
