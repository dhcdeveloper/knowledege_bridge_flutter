import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:knowledege_bridge_flutter/common/json_utils.dart';
import 'package:knowledege_bridge_flutter/model/user_model.dart';

class UserControllerTest {
  static bool isLogin = false;

  static Future<bool> setUserInJson(User user) async {
    bool success = false;

    user.id = 10086;
    user.group = 2;
    user.sex = 1;
    user.birthday = "20240401";
    user.profilePicture = "";
    user.createdAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    user.updatedAt = 0;
    user.deletedAt = 0;

    try {
      JsonUtils jsonUtils = JsonUtils('user.json');
      await jsonUtils.writeCache(jsonEncode(user.toJson()));
      success = true;
      isLogin = true;
      print("保存user缓存成功");
    } catch (e) {
      print("保存user缓存失败: $e");
    }
    return success;
  }

  static Future<User> getUserFromJson() async {
    User user = User();
    try {
      JsonUtils jsonUtils = JsonUtils('user.json');
      String? json = await jsonUtils.readCache();
      Map<String, dynamic> userMap = jsonDecode(json!);
      user = User.fromJson(userMap);
      print(json);
      print("获取user缓存成功");
    } catch (e) {
      print("找不到user缓存: $e");
    }
    return user;
  }

  static Future<bool> deleteUserInJson() async {
    bool success = false;
    try {
      JsonUtils jsonUtils = JsonUtils('user.json');
      try {
        switch (await jsonUtils.deleteFile()) {
          case 0:
            print("存在user缓存");
            success = true;
            isLogin = false;
            print("删除user缓存成功");
            break;
          case 1:
            print("不存在user缓存");
            break;
          default:
            print("读取缓存错误");
            break;
        }
      } catch (e) {
        print("删除user缓存失败: $e");
      }
    } catch (e) {
      print("找不到user缓存: $e");
    }
    return success;
  }
}