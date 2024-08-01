import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:knowledege_bridge_flutter/common/pickfile_utils.dart';
import 'package:knowledege_bridge_flutter/dao/upload_controller.dart';

import '../common/permission_utils.dart';
import '../response/base_response.dart';
import '../response/upload_response.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  Future<void> _uploadFile() async {
    await PermissionUtils.requestPermission();
    PlatformFile? file = await PickFileUtils.pickFile();
    BaseResponse<UploadResponse> res = await UploadController.uploadFile([file!]);
    print(res.responseData!.message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: _uploadFile,
        child: const Icon(Icons.add),
      ),
    );
  }
}
