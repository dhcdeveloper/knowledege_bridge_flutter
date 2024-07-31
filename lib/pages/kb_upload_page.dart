import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:knowledege_bridge_flutter/common/PickFileUtils.dart';
import 'package:knowledege_bridge_flutter/dao/UploadController.dart';

import '../common/PermissionUtils.dart';
import '../model/NetResponse.dart';
import '../model/UploadFile.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  Future<void> _uploadFile() async {
    await PermissionUtils.requestPermission();
    PlatformFile? file = await PickFileUtils.pickFile();
    NetResponse<UploadFile> res = await UploadController.uploadFile([file!]);
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
