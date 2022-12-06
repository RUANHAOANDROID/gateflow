import 'package:dio/dio.dart';

class HttpUtils {
  static const BASE_URL = "http://127.0.0.1:8888";
  static const CONNECT_TIMEOUT = 5000;
  static const RECEIVE_TIMEOUT = 3000;
  static Dio? dio;

  /// 生成Dio实例
  static Dio getInstance() {
    if (dio == null) {
      //通过传递一个 `BaseOptions`来创建dio实例
      var options = BaseOptions(
          baseUrl: BASE_URL,
          connectTimeout: CONNECT_TIMEOUT,
          receiveTimeout: RECEIVE_TIMEOUT);
      dio = new Dio(options);
    }
    return dio!;
  }

  /// 请求api
  static Future<Map<String, dynamic>> request(String path,
      {data, method}) async {
    data = data ?? {};
    method = method ?? "get";

    // 打印请求相关信息：请求地址、请求方式、请求参数
    print("HTTP ：$BASE_URL$path");
    print("HTTP ：$method");
    print("HTTP ：$path");
    print("HTTP：$data");

    var dio = getInstance();
    var res;
    if (method == "get") {
      // get
      var response = await dio.get(path);
      res = response.data;
    } else {
      // post
      var response = await dio.post(path, data: data);
      res = response.data;
    }
    print("HTTP：response");
    print(res);
    return res;
  }

  /// get
  static Future<Map<String, dynamic>> get(path, data) =>
      request(path, data: data);

  /// post
  static Future<Map<String, dynamic>> post(path, data) =>
      request(path, data: data, method: "post");
}
