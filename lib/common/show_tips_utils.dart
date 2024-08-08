import 'package:flutter/material.dart';

import '../widgets/tips_widget.dart';
class ShowTipsUtils{
  static Future showTips(BuildContext context, String tips) async {
    showDialog(context: context, builder: (context) {
      return TipsWidget(content: tips);
    });

    // 使用Timer自动关闭对话框
    await Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pop(); // 关闭对话框
    });
  }
}