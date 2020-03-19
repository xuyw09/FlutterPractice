import 'package:dio/dio.dart';

class DioUtils {
  // static final String BASE_URL = "http://ce-safe.com:8084";
  // static final String BASE_URL = "https://www.wanandroid.com";
  static final String BASE_URL = "https://yuntu.ce-safe.com";
  static DioUtils _instance;
  Dio _dio;
  BaseOptions _baseOptions;

  static DioUtils getInstance() {
    if (_instance == null) {
      _instance = new DioUtils();
    }
  }

  DioUtils() {
    _baseOptions = new BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: 15000,
        receiveTimeout: 15000,
        // headers: {
        //   'cookie': {
        //     'userName': 'xuyw',
        //     'uid': "3fc6aa10643511ea896df1332016a308"
        //   }
        // },
        // contentType: ContentType.json,
        responseType: ResponseType.json);

    _dio = new Dio(_baseOptions);

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions requestions) async {
      print('请求头${requestions.headers.toString()}');
      print('请求参数${requestions.queryParameters.toString()}');
      return requestions;
    }, onResponse: (Response response) {
      return response;
    }, onError: (DioError error) {
      return error;
    }));
  }
  get(url, {data, options, cancelToken}) async {
    print('get request path ----${url}---- 请求参数${data}');
    Response response;

    try {
      response = await _dio.get(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
      print('get success --${response}');
    } on DioError catch (e) {
      print('请求失败---错误类型${e.type}');
    }

    return response.data.toString();
  }

  post(url, {data, options}) async {
    print('post request path ------${url}-------请求参数${data}');
    Response response;
    try {
      response = await _dio.post(url, queryParameters: data, options: options);
      print('post result ---${response.data}');
    } on DioError catch (e) {
      print('请求失败---错误类型${e.type}--错误信息${e.message}');
    }

    return response.data.toString();
  }
}
