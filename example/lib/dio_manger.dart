import 'dart:async';

import 'package:dio/dio.dart';

class DioManagerClass {
  DioManagerClass._();

  static final DioManagerClass getInstance = DioManagerClass._();

  Dio? _dio;

  Dio init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com/",
        responseType: ResponseType.json,
        contentType: "application/json",
        receiveDataWhenStatusError: true,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );
    return _dio!;
  }

  Future<Response> dioGetMethod(
      {required String url,
      Map<String, dynamic>? header,
      Map<String, dynamic>? queryParameters}) async {
    return await _dio!.get(
      url,
      options: Options(headers: header),
      queryParameters: queryParameters,
    );
  }
}
