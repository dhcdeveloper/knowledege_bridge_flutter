import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TipsWidget extends Dialog {
  final String content;

  const TipsWidget({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: ShapeDecoration(
                  color: const Color(0xFFF0EEF5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.r),
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: IntrinsicHeight(
                    child: Text(content,
                        style: const TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
