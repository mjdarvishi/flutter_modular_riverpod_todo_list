import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

// حذف مقادیر خالی یا نال
Map<String, dynamic> _removeNulls(Map<String, dynamic> input) =>
    input..removeWhere((k, v) => v == null);

Dio get http {
  BaseOptions options = BaseOptions(
      baseUrl: 'https://google.com',
      receiveDataWhenStatusError: true,
      sendTimeout: const Duration(seconds: 5),
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5));
  Dio dio = Dio(options);

  dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: false,
      requestBody: true));

  dio.interceptors.add(
      InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
    dio.options.headers["Content-Type"] = "application/json;charset=UTF-8";
    dio.options.headers["Accept"] = "application/json";
    Box box = Hive.box('box');
    String token = box.get('token',defaultValue:'');
    if (token != '') {
      options.headers.addAll({"authorization": "Bearer $token"});
    }
    // مقادیر خالی را از پارامتر ها حذف می کنیم
    // if (options.queryParameters.length > 0) options.queryParameters = _removeNulls(options.queryParameters);
    // if (options.data != null && !(options.data is FormData)) {
    //   options.data = _removeNulls(options.data);
    // }

    return handler.next(options); // ادامه
  }, onResponse: (Response response, handler) async {
    // در زمان پاسخ چه کارهایی انجام دهیم ؟
    return handler.next(response); // ادامه
  }, onError: (DioError e, handler) async {
    // اگر خطایی رخ داد چه کارهایی انجام می دهیم ؟
    return handler.next(e); //ادامه
  }));

  return dio;
}
