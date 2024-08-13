import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:knowledege_bridge_flutter/common/json_utils.dart';
import 'package:knowledege_bridge_flutter/model/user_model.dart';

class UserControllerTest {
  static bool isLogin = false;

  static Future<bool> setUserInJson(User user) async {
    bool success = false;

    user.id = 10086;
    user.name = "小李";
    user.group = 2;
    user.sex = 2;
    user.birthday = "20240401";
    user.profilePicture = "";
    user.createdAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    user.updatedAt = 0;
    user.deletedAt = 0;

    try {
      success = await JsonUtils.saveData('user', user.toJson());
      if (success) {
        isLogin = true;
        print("保存user缓存成功");
      } else {
        print("保存user缓存失败");
      }
    } catch (e) {
      print("保存user缓存出错: $e");
    }
    return success;
  }
  static Future<bool> setUserInJson2(User user) async {
    bool success = false;

    user.id = user.id;
    user.name = user.name;
    user.group = user.group;
    user.sex = user.sex;
    user.birthday = "20240401";
    user.profilePicture = "";
    user.createdAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    user.updatedAt = 0;
    user.deletedAt = 0;

    try {
      success = await JsonUtils.saveData('user', user.toJson());
      if (success) {
        isLogin = true;
        print("保存user缓存成功");
      } else {
        print("保存user缓存失败");
      }
    } catch (e) {
      print("保存user缓存出错: $e");
    }
    return success;
  }

  static Future<User> getUserFromJson() async {
    User user = User();
    try {
      String json = await JsonUtils.readData('user');
      if (json != 'error') {
        user = User.fromJson(jsonDecode(json));
        print(json);
        print("获取user缓存成功");
      } else {
        print("不存在user缓存");
      }
    } catch (e) {
      print("获取user缓存失败: $e");
    }
    return user;
  }

  static Future<bool> deleteUserInJson() async {
    bool success = false;
    try {
      switch (await JsonUtils.deleteData('user')) {
        case true:
          print("存在user缓存");
          success = true;
          isLogin = false;
          print("删除user缓存成功");
          break;
        default:
          print("找不到user缓存");
          break;
      }
    } catch (e) {
      print("删除user缓存出错: $e");
    }
    return success;
  }
}