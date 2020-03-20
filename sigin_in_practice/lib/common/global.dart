import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/user.dart';

class Global {
  static SharedPreferences _prefs;
  static User curUser = User();

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    print("****global***");

    _prefs = await SharedPreferences.getInstance();
    print("****global***");
    print(_prefs.getString("curUser"));
    var _curUser = _prefs.getString("curUser");

    if (_curUser != null) {
      try {
        curUser = User.fromJson(jsonDecode(_curUser));
      } catch (e) {
        print('***global init function error:***' + e);
      }
    }
  }

  // 持久化curUser信息
  static saveCurUser(user) {
    print('global save');
    print(curUser);
    print(user);
    if (user==null) _prefs.setString('curUser', user);
    print(_prefs.getString("curUser"));
    // _prefs.setString('curUser', jsonEncode(curUser.toJson()));
  }
}
