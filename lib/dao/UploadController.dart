import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:knowledege_bridge_flutter/model/UploadFile.dart';

import '../common/DioNetwork.dart';
import '../common/Urls.dart';
import '../model/NetResponse.dart';

class UploadController {
  static Future<NetResponse<UploadFile>> uploadFile(
      List<PlatformFile> files) async {
    NetResponse<UploadFile> response = NetResponse();
    Map<String, MultipartFile> fileMap = {};
    //遍历文件信息
    for (var i = 0; i < files.length; i++) {
      MultipartFile multipartFile =
          await MultipartFile.fromFile(files[i].path!, filename: files[i].name);
      fileMap.putIfAbsent('files$i', () => multipartFile);
    }
    //使用FormData上传文件
    var formData = FormData.fromMap(fileMap);
    response = await DioNetwork().postFormData(
        Urls.upload, formData, (json) => UploadFile.fromJson(json));
    return response;
  }
}
