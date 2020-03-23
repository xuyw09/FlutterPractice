import 'package:flutter/material.dart';
import 'package:sigin_in_practice/pages/Widgets/UserDraw.dart';
import '../../index.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HappyToAnswer'),
      ),
      body: _buildBody(),
      drawer: new UserDrawer(),
    );
  }

  Widget _buildBody() {
    UserModel userModel = Provider.of<UserModel>(context);
    print("---home---");
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
              Navigator.of(context).pushNamed('signin');
            },
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
}
