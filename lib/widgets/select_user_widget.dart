import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/user_model.dart';

class SelectUserWidget extends StatefulWidget {
  SelectUserWidget({super.key, required this.user});

  User user;

  bool select = false;

  @override
  State<SelectUserWidget> createState() => _SelectUserWidgetState();
}

class _SelectUserWidgetState extends State<SelectUserWidget> {

  bool _select = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.w,
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F9),
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5.w,
          ),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _select = !_select;
          });
          widget.select = _select;
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: _select
                  ? Icon(Icons.check_circle)
                  : Icon(Icons.radio_button_unchecked),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: Image.asset(
                  widget.user.profilePicture!,
                  width: 20.w,
                  height: 20.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text("${widget.user.name}"),
          ],
        ),
      ),
    );
  }
}
