import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:knowledege_bridge_flutter/response/upload_response.dart';

import '../common/dio_utils.dart';
import '../common/urls_utils.dart';
import '../response/base_response.dart';

class UploadController {
  static Future<BaseResponse<UploadResponse>> uploadFile(
      List<PlatformFile> files) async {
    BaseResponse<UploadResponse> response = BaseResponse();
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
        Urls.upload, formData, (json) => UploadResponse.fromJson(json));
    return response;
  }
}
