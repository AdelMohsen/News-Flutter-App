import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static late Dio _dio;

  static init() {
    _dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true));
  }

  static Future<Response> getData(
      {required String url,required Map<String, dynamic> quires}) async {
    return await _dio.get(url, queryParameters: quires).catchError((error) {
      print(error.toString());
    });
  }
}
