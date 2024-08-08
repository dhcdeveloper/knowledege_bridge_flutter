import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../model/share_content.dart';

class ShareCardWidget extends StatefulWidget {
  const ShareCardWidget({super.key, required this.shareContent});

  final ShareContent shareContent;

  @override
  State<ShareCardWidget> createState() => _ShareCardWidgetState();
}

class _ShareCardWidgetState extends State<ShareCardWidget> {
  String _subMainBody(String mainBody) {
    if (mainBody.length <= 10) {
      return mainBody;
    } else {
      return "${mainBody.substring(0, 10)}···";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 190.w,
          padding: EdgeInsets.fromLTRB(15.w, 15.w, 15.w, 0.w),
          color: const Color(0xFFF5F5F5),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            // widget.shareContent.user.profilePicture!,
                            'lib/images/rabbit.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 11,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.shareContent.title,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            _subMainBody(widget.shareContent.mainBody),
                            style: TextStyle(
                              color: const Color(0xFFA9A9A9),
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 1.w,
                  margin: EdgeInsets.only(bottom: 5.w),
                  color: const Color(0xFFDCDCDC),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "发布用户：",
                          style: TextStyle(
                            color: const Color(0xFFA9A9A9),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: widget.shareContent.user.name,
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "开始时间：",
                          style: TextStyle(
                            color: const Color(0xFFA9A9A9),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: DateFormat('yyyy-MM-dd HH:mm')
                              .format(widget.shareContent.startTime),
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "结束时间：",
                          style: TextStyle(
                            color: const Color(0xFFA9A9A9),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: DateFormat('yyyy-MM-dd HH:mm')
                              .format(widget.shareContent.endTime),
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "有效时长：",
                          style: TextStyle(
                            color: const Color(0xFFA9A9A9),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: widget.shareContent.isExpire ? '已过期' : "${widget.shareContent.effectiveHour}小时${widget.shareContent.effectiveMinute}分钟",
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 1.w,
                  margin: EdgeInsets.symmetric(vertical: 4.w),
                  color: const Color(0xFFDCDCDC),
                ),
                Container(
                  height: 30.w,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 61.w,
                        child: widget.shareContent.user.name == '小李'
                            ? ShareCardButton(
                                buttonText: '删除',
                                buttonIcon: Icons.delete,
                                buttonFunction: () {},
                              )
                            : Container(),
                      ),
                      Container(
                        width: 122.w,
                      ),
                      SizedBox(
                        width: 61.w,
                        child: widget.shareContent.user.name == '小李'
                            ? ShareCardButton(
                                buttonText: '修改',
                                buttonIcon: Icons.open_in_new,
                                buttonFunction: () {},
                              )
                            : Container(),
                      ),
                      Container(
                        width: 5.w,
                      ),
                      SizedBox(
                        width: 61.w,
                        child: ShareCardButton(
                          buttonText: '查看',
                          buttonIcon: Icons.visibility,
                          buttonFunction: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 40.w,
          top: 30.w,
          child: Container(
            width: 100.w,
            height: 100.w,
            color: Colors.red,
            child: Image.asset(
              widget.shareContent.isExpire
                  ? 'lib/images/expired.png'
                  : 'lib/images/effective.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class ShareCardButton extends StatelessWidget {
  const ShareCardButton(
      {super.key,
      required this.buttonText,
      required this.buttonIcon,
      required this.buttonFunction});

  final String buttonText;

  final IconData buttonIcon;

  final VoidCallback? buttonFunction;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        minimumSize: MaterialStateProperty.all(Size.zero),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w)),
        side: MaterialStateProperty.all(
          const BorderSide(
            color: Color(0xFFDCDCDC),
          ),
        ),
      ),
      onPressed: buttonFunction,
      child: Row(
        children: [
          Icon(
            buttonIcon,
            color: Colors.black,
            size: 15.w,
          ),
          SizedBox(
            width: 3.w,
          ),
          Text(
            buttonText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }
}
