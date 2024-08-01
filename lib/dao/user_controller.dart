import 'package:knowledege_bridge_flutter/common/urls_utils.dart';
import 'package:knowledege_bridge_flutter/model/user_model.dart';

import '../response/base_response.dart';
import '../common/dio_utils.dart';

class UserController {
// 登录接口，登录成功后返回用户信息
  static Future<BaseResponse<User>> userLogin(
      String email, String password) async {
    BaseResponse<User> response;
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
