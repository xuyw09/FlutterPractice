import 'package:flutter/material.dart';
import '../../index.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Global.curUser;
    UserModel userModel = Provider.of<UserModel>(context);

    Widget userHeader = UserAccountsDrawerHeader(
      accountName: new Text("你好~ ${user.realName}"),
      accountEmail: new Text("${user.mail}"),
      currentAccountPicture: ClipOval(
        child: Image.network(
          "${user.avatar}",
          width: 50,
        ),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/drawer_header.png"),
              fit: BoxFit.cover)),
    );

    Widget userMenu = Expanded(
      flex: 12,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            title: Text("${user.authorityDescription} "),
            leading: Icon(Icons.supervisor_account),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          ),
          ListTile(
            title: Text("${user.corporation} -- ${user.department}"),
            leading: Icon(Icons.account_balance),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          ),
          ListTile(
            title: Text("已关注项目"),
            leading: Icon(Icons.stars),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            trailing: Icon(Icons.keyboard_arrow_right),
            enabled: true,
            onTap: () => print('查看关注项目'),
          ),
          ListTile(
            title: Text("未读消息"),
            leading: Icon(Icons.message),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            trailing: Icon(Icons.keyboard_arrow_right),
            enabled: true,
            onTap: () => print('查看未读消息'),
          ),
          ListTile(
            title: Text("查看帮助"),
            leading: Icon(Icons.question_answer),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            trailing: Icon(Icons.keyboard_arrow_right),
            enabled: true,
            onTap: () => print('进入帮助'),
          ),
        ],
      ),
    );

    signOut(BuildContext context) {
      AlertDialog alert = AlertDialog(
        title: Text('退出'),
        content: Text('你确定要退出登录？'),
        actions: <Widget>[
          FlatButton(
            child: Text('取消'),
            onPressed: () => Navigator.pop(context),
          ),
          FlatButton(
            child: Text('确认'),
            onPressed: () async {
              userModel.user = null;
              final prefs = await SharedPreferences.getInstance();
              print(prefs.getString('curUser'));
              Navigator.of(context).pushNamed('signin');
            },
          )
        ],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }

    Widget userHandle = Expanded(
      //TODO flatbutton 应当充满整个row
        flex: 1,
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black54,
                  ),
                  label: Text('设置',
                      style: TextStyle(
                          fontWeight: FontWeight.w100, color: Colors.black54)),
                  onPressed: () {
                    print('进入设置界面');
                  },
                ),
                FlatButton.icon(
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  icon: Icon(
                    Icons.input,
                    color: Colors.black54,
                  ),
                  label: Text(
                    '退出',
                    style: TextStyle(
                        fontWeight: FontWeight.w100, color: Colors.black54),
                  ),
                  onPressed: () {
                    print('退出登录');
                    signOut(context);
                  },
                ),
              ],
            )));

    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              userHeader,
              userMenu,
              Divider(
                color: Colors.black54,
              ),
              userHandle
            ],
          )),
    );
  }
}
