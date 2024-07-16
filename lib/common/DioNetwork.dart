import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/NetResponse.dart';

class DioNetwork {
  static final DioNetwork _instance = DioNetwork._internal();
  late Dio dio;

  factory DioNetwork() {
    return _instance;
  }

  DioNetwork._internal() {
    dio = Dio(BaseOptions(
      baseUrl: 'http://172.16.232.179:8888/api/',));
  }

  // 发送GET请求
  Future<NetResponse> get(String url, Map<String, dynamic> params) async {
    Response? response;
    try {
      response = await dio.get(url, queryParameters: params);
    } on DioException catch (e) {
      // 处理错误
      print('get请求发生错误: ${e.message}');
      response = e.response;
    }
    return NetResponse.fromJson(jsonDecode(response.toString()));
  }

  // 发送POST请求
  Future<NetResponse> post(String url, Map<String, dynamic> params) async {
    Response? response;
    try {
      response = await dio.post(url, data: params);
    } on DioException catch (e) {
      // 处理错误
      print('post请求发生错误: ${e.message}');
      response = e.response;
    }
    return NetResponse.fromJson(jsonDecode(response.toString()));
  }
}