import 'package:dio/dio.dart';

class DioUtils {
  static final String BASE_URL = "https://www.wanandroid.com";
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
        connectTimeout: 5000,
        receiveTimeout: 5000,
        headers: {},
        // contentType: ContentType.json,
        responseType: ResponseType.json);

    _dio = new Dio(_baseOptions);

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions requestions) async {
      requestions.queryParameters["token"] = "testtoken123443423";
      requestions.queryParameters['userId'] = "123456";
      print('请求参数${requestions.headers.toString()}');
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
      // print('get success --${response.data}');
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
