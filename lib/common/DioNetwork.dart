import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:knowledege_bridge_flutter/common/Urls.dart';

import '../model/NetResponse.dart';

class DioNetwork {
  static final DioNetwork _instance = DioNetwork._internal();
  late Dio dio;

  factory DioNetwork() {
    return _instance;
  }

  DioNetwork._internal() {
    dio = Dio(BaseOptions(
      baseUrl: Urls.baseUrl,));
  }

  // 发送GET请求
  Future<NetResponse<T>> get<T>(String url, Map<String, dynamic> params,T Function(dynamic? json) fromJsonT) async {
    Response? response;
    try {
      response = await dio.get(url, queryParameters: params);
    } on DioException catch (e) {
      // 处理错误
      print('get请求发生错误: ${e.message}');
      response = e.response;
    }
    return NetResponse.fromJson(jsonDecode(response.toString()), fromJsonT);
  }

  // 发送POST请求
  Future<NetResponse<T>> post<T>(String url, Map<String, dynamic> params,T Function(dynamic? json) fromJsonT) async {
    Response? response;
    try {
      response = await dio.post(url, data: params);
    } on DioException catch (e) {
      // 处理错误
      print('post请求发生错误: ${e.message}');
      response = e.response;
    }
    return NetResponse.fromJson(jsonDecode(response.toString()), fromJsonT);
  }

  // 发送POST请求(FormData)
  Future<NetResponse<T>> postFormData<T>(String url, FormData params,T Function(dynamic? json) fromJsonT) async {
    Response? response;
    try {
      response = await dio.post(url, data: params);
    } on DioException catch (e) {
      // 处理错误
      print('post请求发生错误: ${e.message}');
      response = e.response;
    }
    return NetResponse.fromJson(jsonDecode(response.toString()), fromJsonT);
  }
}