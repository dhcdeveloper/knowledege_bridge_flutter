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
    return Container(
      padding: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(right: 5.r),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: Image.asset(
                widget.user.profilePicture!,
                width: 20.r,
                height: 20.r,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            widget.user.name!,
            style: TextStyle(
              fontSize: 12.r,
            ),
          ),
        ],
      ),
    );
  }
}
