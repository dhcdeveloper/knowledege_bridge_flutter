// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NetResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetResponse _$NetResponseFromJson(Map<String, dynamic> json) => NetResponse()
  ..response = (json['response'] as num).toInt()
  ..errorText = json['error_text'] as String?
  ..responseData = json['data'] == null
      ? null
      : User.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$NetResponseToJson(NetResponse instance) =>
    <String, dynamic>{
      'response': instance.response,
      'error_text': instance.errorText,
      'data': instance.responseData,
    };
