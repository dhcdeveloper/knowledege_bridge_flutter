import 'package:file_picker/file_picker.dart';
import 'package:knowledege_bridge_flutter/common/permission_utils.dart';

class PickFileUtils {
  static Future<PlatformFile?> pickFile(bool kIsWeb) async {
    if (!kIsWeb) {
      //获取文件权限
      await PermissionUtils.requestPermission();
    }

    //选择文件
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      //文件类型所有
      type: FileType.any,
      withData: false,
      withReadStream: true,
    );

    if (result != null) {
      //获取选择的文件
      PlatformFile file = result.files.first;
      return file;
    } else {
      print("取消选择文件");
      return null;
    }
  }
}
