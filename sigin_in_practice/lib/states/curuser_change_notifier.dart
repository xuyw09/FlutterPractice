import 'package:flutter/cupertino.dart';
import 'package:sigin_in_practice/common/global.dart';
import '../models/user.dart';

class CurUserChangeNotifier extends ChangeNotifier {
  User get _curUser => Global.curUser;

  @override
  void notifyListeners() {
    print('user notifyListeners');
    Global.saveCurUser(null);
    super.notifyListeners();
  }
}

class UserModel extends CurUserChangeNotifier {
  User get user => _curUser;

  bool get isLogin => user?.userName != null;

//用户信息发生变化，更新用户信息并通知依赖它的子孙Widgets更新
  set user(User user) {
    if (user?.userName != _curUser?.userName) {
      _curUser?.userName = user?.userName;
      notifyListeners();
    }
  }
}
