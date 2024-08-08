import 'package:knowledege_bridge_flutter/model/user_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'share_content.g.dart';

@JsonSerializable()
class ShareContent {
  //主题
  String title;
  //正文
  String mainBody;
  //发布者
  User user;
  //分享用户
  List<User> shareUsers;
  //分享文件名
  List<String> fileNameList;
  //分享文件路径
  List<String> filePathList;
  //有效起始时间
  DateTime startTime;
  //有效结束时间
  DateTime endTime;
  //是否过期
  bool isExpire;
  //有效时间小时
  int effectiveHour;
  //有效时间分钟
  int effectiveMinute;

  ShareContent({required this.title, required this.mainBody, required this.user, required this.shareUsers, required this.fileNameList, required this.filePathList, required this.startTime, required this.endTime, required this.isExpire, required this.effectiveHour, required this.effectiveMinute});

  factory ShareContent.fromJson(Map<String, dynamic> json) =>
      _$ShareContentFromJson(json);

  Map<String, dynamic> toJson() => _$ShareContentToJson(this);
}