import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {

  BaseResponse();

  late int response;
  late String? errorText;
  late T? responseData;

  factory BaseResponse.fromJson(Map<String,dynamic> json, T Function(Object? json) fromJsonT) => _$BaseResponseFromJson<T>(json, fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$BaseResponseToJson<T>(this, toJsonT);
}
