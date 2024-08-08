import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/user_model.dart';

class HeadPortraitWidget extends StatefulWidget {
  const HeadPortraitWidget({super.key, required this.user});

  final User user;

  @override
  State<HeadPortraitWidget> createState() => _HeadPortraitWidgetState();
}

class _HeadPortraitWidgetState extends State<HeadPortraitWidget> {
  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.all(5.w),
      labelPadding: EdgeInsets.all(0.w),
      //用户头像
      avatar: ClipRRect(
        borderRadius: BorderRadius.circular(5.r),
        child: Image.asset(
          widget.user.profilePicture!,
          width: 20.w,
          height: 20.w,
          fit: BoxFit.cover,
        ),
      ),
      //用户名称
      label: Text(widget.user.name!),
    );
  }
}
