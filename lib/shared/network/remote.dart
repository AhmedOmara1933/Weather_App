import 'package:dio/dio.dart';

class DioHelper1 {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://api.weatherapi.com/',
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio!.get(url, queryParameters: query);
  }
}

class DioHelper2 {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
          receiveDataWhenStatusError: true,
          baseUrl: 'https://student.valuxapps.com/api/',
          headers: {
            'Content-Type': 'application/json',
          }),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {'Authorization': token, 'lang': lang};
    return await dio!.post(url, queryParameters: query, data: data);
  }
}
