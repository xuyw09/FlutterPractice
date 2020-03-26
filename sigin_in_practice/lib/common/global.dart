import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigin_in_practice/common/http/HttpUtils.dart';
import 'package:sigin_in_practice/common/index.dart';
import 'dart:convert';

import '../models/user.dart';
import '../models/city.dart';

class Global {
  static SharedPreferences _prefs;
  static User curUser = User();
  static City curCity = City();
  static List<City> cityList;

  //初始化全局信息
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    _prefs = await SharedPreferences.getInstance();
    var _curUser = _prefs.getString("curUser");
    var _curCity = _prefs.getString("curCity");
    var _cityList = _prefs.getString("cityList");

    if (_curUser != null) {
      try {
        curUser = User.fromJson(jsonDecode(_curUser));
      } catch (e) {
        print('-----global init function error:' + e);
      }
    }

    if (_cityList != null) {
      try {
        cityList = jsonDecode(_cityList).map((c) => City.fromJson(c)).toList();
      } catch (e) {
        print('-----global init function error:' + e);
      }
    } else {
      var r = await HttpUtils.getCityList();
      cityList = r;
      if (curCity.name == null) {
        curCity = cityList[0];
        _prefs.setString("curCity", jsonEncode(curCity.toJson()));
      }
      _prefs.setString("cityList", r.toString());
    }

    if (_curCity != null) {
      try {
        curCity = City.fromJson(jsonDecode(_curCity));
      } catch (e) {
        print('-----global init function error:' + e);
      }
    }

    //初始化网络请求
    HttpUtils.init();
  }

  // 持久化curUser信息
  static saveCurUser(user) {
    print('global save -- curUser Changed');
    if (user == null) {
      _prefs.setString('curUser', user);
      _prefs.clear();
    }
    _prefs.setString('curUser', jsonEncode(curUser.toJson()));
  }

  static saveCurCity(city) {
    print('global save -- curCity Changed');
    _prefs.setString("curCity", jsonEncode(city.toJson()));
  }
}
