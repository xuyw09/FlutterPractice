import 'dart:io';
import 'package:dio/dio.dart';
import '../../index.dart';

class HttpUtils {
  // 在网络请求过程中可能会需要使用当前的context信息，比如在请求失败时
  // 打开一个新路由，而打开新路由需要context信息。
  HttpUtils([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext context;
  Options _options;

  static Dio dio = new Dio();
  static void init() {
    // 设置用户token（可能为null，代表未登录）
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.curUser?.uid;
    //添加拦截器
    dio.interceptors
      ..add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        User user = Global.curUser;
        options.headers
          ..addAll({
            "cookie": {"userName": user.userName},
            'cookie': {'uid': user.uid}
          });
        return options;
      }))
      ..add(LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
  }

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static Future<User> signIn(String username, String password) async {
    print("---sign in---");
    dio.options.baseUrl = ApiUrl['login'];
    Response response = await dio.post('/user/login',
        data: {"username": username, "password": password});
    if (response.statusCode == 200) {
      User user = User.fromJson(response.data);
      return user;
    } else {
      print('---SignIn failure:${response.statusCode}');
      return null;
    }
  }

  static Future<List<City>> getCityList() async {
    print("---get cities---");
    dio.options.baseUrl = ApiUrl['meta'];
    Response response = await dio.get('/meta/cities');

    if (response.statusCode == 200) {
      // data = response.data.map((c)=>City.fromJson(c)).toList();  这样运行会出错，暂时还不知道为什么  --！
      var data = response.data.map((c) {
        var city = City.fromJson(c);
        return city;
      }).toList();

      List<City> cityList = new List<City>.from(data);
      return cityList;
    } else {
      print('---GetCities failure:${response.statusCode}');
      return null;
    }
  }

  static Future<List<Project>> getProjectList(String cityName) async {
    print("---get line list with projects---");
    dio.options.baseUrl = ApiUrl['auto'];
    Response response = await dio.get('/auto/city/${cityName}/lines');

    if (response.statusCode == 200) {
      var data = response.data.map((line) {
        var linePrj = LinePrjs.fromJson(line);
        return linePrj;
      }).toList();

      List<LinePrjs> linePrjsList = new List<LinePrjs>.from(data);

      List<Project> projectList=[];
      linePrjsList.forEach((line) {

        List<Project> originalList = line.projects.map((p) {
          var _p = Project.fromJson(p);
          return _p;
        }).toList();

        var _projects = List<Project>.from(originalList);
        projectList.addAll(_projects);
      });
      print('----共有项目个数：-----${projectList.length}');

      return projectList;
    } else {
      print('---GetCities failure:${response.statusCode}');
      return null;
    }
  }
}

Map<String, String> ApiUrl = const {
  "login": "https://sso.ce-safe.com",
  "auto": "http://www.ce-safe.com:8086",
  "meta": "http://www.ce-safe.com:8084"
};
