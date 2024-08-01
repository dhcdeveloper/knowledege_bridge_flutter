import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  static requestPermission() async {
    //获取当前应用读写文件权限
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      //如果没有权限，请求获取权限
      status = await Permission.storage.request();
    }
  }
}
