import 'package:json_annotation/json_annotation.dart';

import 'User.dart';

part 'NetResponse.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class NetResponse<T> {

  NetResponse();

  late int response;
  late String? errorText;
  late T? responseData;

  factory NetResponse.fromJson(Map<String,dynamic> json, T Function(Object? json) fromJsonT) => _$NetResponseFromJson<T>(json, fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$NetResponseToJson<T>(this, toJsonT);
}
