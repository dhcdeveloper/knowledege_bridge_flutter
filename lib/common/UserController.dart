import '../model/NetResponse.dart';
import 'DioNetwork.dart';

class UserController {

// 登录接口，登录成功后返回用户信息
  Future<NetResponse> userLogin(String email, String password) async {
  NetResponse response;
  response = await DioNetwork().post("/login",
      {
        "email": email,
        "password": password,
      });
  return response;
  }
}