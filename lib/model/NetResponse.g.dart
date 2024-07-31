// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NetResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetResponse<T> _$NetResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    NetResponse<T>()
      ..response = (json['response'] as num).toInt()
      ..errorText = json['error_text'] as String?
      ..responseData =
          _$nullableGenericFromJson(json['data'], fromJsonT);

Map<String, dynamic> _$NetResponseToJson<T>(
  NetResponse<T> instance,
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
