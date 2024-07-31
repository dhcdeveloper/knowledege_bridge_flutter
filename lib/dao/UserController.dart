import 'package:knowledege_bridge_flutter/common/Urls.dart';
import 'package:knowledege_bridge_flutter/model/User.dart';

import '../model/NetResponse.dart';
import '../common/DioNetwork.dart';

class UserController {
// 登录接口，登录成功后返回用户信息
  static Future<NetResponse<User>> userLogin(
      String email, String password) async {
    NetResponse<User> response;
    response = await DioNetwork().post(
        Urls.userLogin,
        {
          "email": email,
          "password": password,
        },
        (json) => User.fromJson(json));
    return response;
  }
}
