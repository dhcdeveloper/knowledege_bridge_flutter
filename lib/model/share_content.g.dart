// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareContent _$ShareContentFromJson(Map<String, dynamic> json) => ShareContent(
      title: json['title'] as String,
      mainBody: json['mainBody'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      shareUsers: (json['shareUsers'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      fileNameList: (json['fileNameList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      filePathList: (json['filePathList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      isExpire: json['isExpire'] as bool,
      effectiveHour: (json['effectiveHour'] as num).toInt(),
      effectiveMinute: (json['effectiveMinute'] as num).toInt(),
    );

Map<String, dynamic> _$ShareContentToJson(ShareContent instance) =>
    <String, dynamic>{
      'title': instance.title,
      'mainBody': instance.mainBody,
      'user': instance.user,
      'shareUsers': instance.shareUsers,
      'fileNameList': instance.fileNameList,
      'filePathList': instance.filePathList,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'isExpire': instance.isExpire,
      'effectiveHour': instance.effectiveHour,
      'effectiveMinute': instance.effectiveMinute,
    };
