import 'package:knowledege_bridge_flutter/common/Urls.dart';

import '../model/NetResponse.dart';
import '../common/DioNetwork.dart';

class UserController {

// 登录接口，登录成功后返回用户信息
  Future<NetResponse> userLogin(String email, String password) async {
  NetResponse response;
  response = await DioNetwork().post(Urls.userLogin,
      {
        "email": email,
        "password": password,
      });
  return response;
  }
}