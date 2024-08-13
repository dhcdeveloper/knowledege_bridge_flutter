import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadWidget extends StatefulWidget {
  const UploadWidget({super.key, required this.file});

  final PlatformFile file;

  @override
  State<UploadWidget> createState() => _UploadWidgetState();
}

class _UploadWidgetState extends State<UploadWidget> {
  bool _isImage = false;

  @override
  initState() {
    super.initState();
    if (kIsWeb) {
      _isImage = false;
    } else {
      //获取文件类型
      final String? mimeType = lookupMimeType(widget.file.path!);
      setState(() {
        //判断文件是否为图片
        _isImage = mimeType!.startsWith('image/');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //文件类型是图片则显示缩略图，否则显示文件名
    if (_isImage) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: const Color(0xFFD0D0D0),
            width: 1.r,
          ),
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.file(
              File(widget.file.path!),
              width: 70.r,
              height: 70.r,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: 70.r,
        height: 70.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: const Color(0xFFD0D0D0),
            width: 1.r,
          ),
          color: const Color(0xFFF3F3F3),
        ),
        child: Center(
          child: Text(widget.file.name),
        ),
      );
    }
  }
}
