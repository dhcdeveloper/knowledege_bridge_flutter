// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponse<T>()
      ..response = (json['response'] as num).toInt()
      ..errorText = json['error_text'] as String?
      ..responseData =
          _$nullableGenericFromJson(json['data'], fromJsonT);

Map<String, dynamic> _$BaseResponseToJson<T>(
    BaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'response': instance.response,
      'error_text': instance.errorText,
      'data': _$nullableGenericToJson(instance.responseData, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
