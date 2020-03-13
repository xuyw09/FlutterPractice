import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../common/DioUtils.dart';

class NetWorkPage extends StatefulWidget {
  @override
  _NetWorkPageState createState() => _NetWorkPageState();
}

class _NetWorkPageState extends State<NetWorkPage> {
  var resultJson = "";

  @override
  void initState() {
    super.initState();
  }

  getRequest() async {
    var data = {"cid": 60};
    String result = await DioUtils().get('/article/list/0/json', data: data);
    // await DioUtils().get('/banner/json');
    this.setState(() {
      resultJson = result;
    });
  }

  postRequest() async {
    var path = "https://www.wanandroid.com/user/register";
    var params = {
      "username": "xuyw",
      "password": "123456",
      "repassword": "123456"
    };

    Response response = await Dio().post(path, queryParameters: params);
    this.setState(() {
      resultJson = response.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dio 网络请求'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MaterialButton(
              color: Colors.pink,
              child: Text('Get Method'),
              onPressed: () {
                getRequest();
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Post Method'),
              onPressed: () {
                postRequest();
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: resultJson.length <= 0
                      ? Text("数据加载中...")
                      : Text(resultJson, style: TextStyle(fontSize: 16)),
                ),
              ),
            )
          ],
        ));
  }
}
