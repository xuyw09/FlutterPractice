import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../common/DioUtils.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

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
    // var data = {"cid": 60};
    var data = {"front": 1};
    // String result = await DioUtils().get('/article/list/0/json', data: data);
    String result = await DioUtils()
        .get('/metro/project/authorizedProjectTypes', data: data);
    // String result = await DioUtils().get('/meta/cities');
    this.setState(() {
      resultJson = result;
    });
  }

  getYuntuData() async {
    var path = "https://yuntu.ce-safe.com";
    var _options = BaseOptions(baseUrl: path, headers: {
      "cookie": 'userName=xuyw;',
      "cookie":
          "uid=3f32b090672c11eaae52f95cc42dd7ea;"
    });
    Response response = await Dio(_options)
        .get("/metro/project/authorizedProjectTypes?front=1");
    print(response.headers.toString());
    // Response response = await Dio().get("http://ce-safe.com:8084/meta/cities");
    print(response.data.toString());
    this.setState(() {
      resultJson = response.toString();
    });
  }

  getYuntuDataWithCookieJar() async {
    var dio = Dio();
    var cookieJar = CookieJar();
    // dio.interceptors.add(CookieManager(cookieJar));

    List<Cookie> cookies = [
      new Cookie("userName", "xuyw"),
      new Cookie("uid", "3f32b090672c11eaae52f95cc42dd7ea")
    ];
    cookies.forEach((cookie) {
      cookie.expires = DateTime.parse("2020-03-17T02:17:11.638Z");
      cookie.httpOnly = false;
    });
    print(cookies[1].toString());

    // cookieJar.saveFromResponse(Uri.parse("https://yuntu.ce-safe.com"), cookies);

    var path = "https://yuntu.ce-safe.com";
    var _options = BaseOptions(baseUrl: path, headers: {'cookie':cookies[0].toString(),'cookie':cookies[1].toString()});
    Response response = await Dio(_options)
        .get("/metro/project/authorizedProjectTypes?front=1");

    print(response.data.toString());
    this.setState(() {
      resultJson = response.toString();
    });
  }

  getBaidu() async {
    var dio = Dio();
    var cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
    await dio.get("https://baidu.com/");
    // Print cookies
    print(cookieJar.loadForRequest(Uri.parse("https://baidu.com/")));
    // second request with the cookie
    Response response = await dio.get("https://baidu.com/");
    this.setState(() {
      resultJson = response.toString();
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
            MaterialButton(
              color: Colors.green,
              child: Text('YuntuData'),
              onPressed: () {
                getYuntuData();
              },
            ),
            MaterialButton(
              color: Colors.orange,
              child: Text('GetYuntuDataWithCookieJar'),
              onPressed: () {
                getYuntuDataWithCookieJar();
              },
            ),
            MaterialButton(
              color: Colors.yellow,
              child: Text('Baidu'),
              onPressed: () {
                getBaidu();
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
