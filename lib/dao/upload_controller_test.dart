import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:knowledege_bridge_flutter/dao/user_controller_test.dart';
import 'package:knowledege_bridge_flutter/model/share_content.dart';

import '../common/json_utils.dart';
import '../model/user_model.dart';

class UploadControllerTest {
  static bool isUpload = false;

  static Future<bool> setShareContentInJson(String title, String mainBody,
      List<User> shareUsers, List<PlatformFile> fileList) async {
    bool success = false;

    //发布者
    User user = await UserControllerTest.getUserFromJson();
    //分享文件名
    List<String> fileNameList = fileList.map((file) => file.name).toList();
    //分享文件路径
    List<String> filePathList = fileList.map((file) => file.path!).toList();
    //有效起始时间
    DateTime startTime = DateTime.now();
    //有效结束时间
    DateTime endTime = startTime.add(const Duration(days: 1));

    ShareContent shareContent = ShareContent(
        title: title,
        mainBody: mainBody,
        user: user,
        shareUsers: shareUsers,
        fileNameList: fileNameList,
        filePathList: filePathList,
        startTime: startTime,
        endTime: endTime,
        isExpire: false,
        effectiveHour: 24,
        effectiveMinute: 0);

    try {
      JsonUtils jsonUtils = JsonUtils('shareContent.json');
      await jsonUtils.writeCache(jsonEncode(shareContent.toJson()));
      success = true;
      isUpload = true;
      print("保存shareContent缓存成功");
    } catch (e) {
      print("保存shareContent缓存失败: $e");
    }
    return success;
  }

  static Future<bool> updateShareContentInJson(ShareContent shareContent) async {
    bool success = false;

    try {
      JsonUtils jsonUtils = JsonUtils('shareContent.json');
      await jsonUtils.writeCache(jsonEncode(shareContent.toJson()));
      success = true;
      isUpload = true;
      print("更新shareContent缓存成功");
    } catch (e) {
      print("更新shareContent缓存失败: $e");
    }
    return success;
  }

  static Future<ShareContent?> getShareContentFromJson() async {
    ShareContent? shareContent;
    try {
      JsonUtils jsonUtils = JsonUtils('shareContent.json');
      String? json = await jsonUtils.readCache();
      Map<String, dynamic> shareContentMap = jsonDecode(json!);
      shareContent = ShareContent.fromJson(shareContentMap);

      DateTime now = DateTime.now();
      if (shareContent.endTime.isAfter(now)) {
        shareContent.effectiveHour = shareContent.endTime.difference(now).inHours;
        shareContent.effectiveMinute = shareContent.endTime.difference(now).inMinutes % 60;
      } else {
        shareContent.isExpire = true;
        shareContent.effectiveHour = 0;
        shareContent.effectiveMinute = 0;
      }

      await updateShareContentInJson(shareContent);

      print(json);
      print("获取shareContent缓存成功");
    } catch (e) {
      print("找不到shareContent缓存: $e");
    }
    return shareContent;
  }

  static Future<bool> deleteShareContentInJson() async {
    bool success = false;
    try {
      JsonUtils jsonUtils = JsonUtils('shareContent.json');
      try {
        switch (await jsonUtils.deleteFile()) {
          case 0:
            print("存在shareContent缓存");
            success = true;
            isUpload = false;
            print("删除shareContent缓存成功");
            break;
          case 1:
            print("不存在shareContent缓存");
            break;
          default:
            print("读取缓存错误");
            break;
        }
      } catch (e) {
        print("删除shareContent缓存失败: $e");
      }
    } catch (e) {
      print("找不到shareContent缓存: $e");
    }
    return success;
  }
}
