import 'package:file_picker/file_picker.dart';

class PickFileUtils {
  static Future<PlatformFile?> pickFile() async {
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
