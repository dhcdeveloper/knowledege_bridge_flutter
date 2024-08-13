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
    return Container(
      alignment: Alignment.center,
      height: 200.r,
      width: 360.r,
      child: Stack(
        children: [
          Container(
            height: 200.r,
            width: 360.r,
            padding: EdgeInsets.fromLTRB(15.r, 15.r, 15.r, 0.r),
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
                          padding: EdgeInsets.all(8.r),
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
                                fontSize: 15.r,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              _subMainBody(widget.shareContent.mainBody),
                              style: TextStyle(
                                color: const Color(0xFFA9A9A9),
                                fontSize: 12.r,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 1.r,
                    margin: EdgeInsets.only(bottom: 5.r),
                    color: const Color(0xFFDCDCDC),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 1.r),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "发布用户：",
                            style: TextStyle(
                              color: const Color(0xFFA9A9A9),
                              fontSize: 12.r,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: widget.shareContent.user.name,
                            style: TextStyle(
                              fontSize: 12.r,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 1.r),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "开始时间：",
                            style: TextStyle(
                              color: const Color(0xFFA9A9A9),
                              fontSize: 12.r,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: DateFormat('yyyy-MM-dd HH:mm')
                                .format(widget.shareContent.startTime),
                            style: TextStyle(
                              fontSize: 12.r,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 1.r),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "结束时间：",
                            style: TextStyle(
                              color: const Color(0xFFA9A9A9),
                              fontSize: 12.r,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: DateFormat('yyyy-MM-dd HH:mm')
                                .format(widget.shareContent.endTime),
                            style: TextStyle(
                              fontSize: 12.r,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 1.r),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "有效时长：",
                            style: TextStyle(
                              color: const Color(0xFFA9A9A9),
                              fontSize: 12.r,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: widget.shareContent.isExpire
                                ? '已过期'
                                : "${widget.shareContent.effectiveHour}小时${widget.shareContent.effectiveMinute}分钟",
                            style: TextStyle(
                              fontSize: 12.r,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 1.r,
                    margin: EdgeInsets.symmetric(vertical: 4.r),
                    color: const Color(0xFFDCDCDC),
                  ),
                  Container(
                    height: 34.r,
                    padding: EdgeInsets.symmetric(horizontal: 10.r),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 25.r,
                          width: 61.r,
                          child: widget.shareContent.user.name == '小李'
                              ? ShareCardButton(
                                  buttonText: '删除',
                                  buttonIcon: Icons.delete,
                                  buttonFunction: () {},
                                )
                              : Container(),
                        ),
                        Container(
                          height: 25.r,
                          width: 122.r,
                        ),
                        SizedBox(
                          height: 25.r,
                          width: 61.r,
                          child: widget.shareContent.user.name == '小李'
                              ? ShareCardButton(
                                  buttonText: '修改',
                                  buttonIcon: Icons.open_in_new,
                                  buttonFunction: () {},
                                )
                              : Container(),
                        ),
                        Container(
                          height: 25.r,
                          width: 5.r,
                        ),
                        SizedBox(
                          height: 25.r,
                          width: 61.r,
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
            right: 40.r,
            top: 30.r,
            child: Container(
              width: 100.r,
              height: 100.r,
              child: Image.asset(
                widget.shareContent.isExpire
                    ? 'lib/images/expired.png'
                    : 'lib/images/effective.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
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
            EdgeInsets.symmetric(vertical: 5.r, horizontal: 10.r)),
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
            size: 15.r,
          ),
          SizedBox(
            width: 3.r,
          ),
          Text(
            buttonText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 11.r,
            ),
          ),
        ],
      ),
    );
  }
}
