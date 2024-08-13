import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/select_user.dart';

class SelectUserWidget extends StatefulWidget {
  const SelectUserWidget({super.key, required this.selectUser});

  final SelectUser selectUser;

  @override
  State<SelectUserWidget> createState() => _SelectUserWidgetState();
}

class _SelectUserWidgetState extends State<SelectUserWidget> {
  bool _select = false;

  @override
  initState() {
    super.initState();

    setState(() {
      _select = widget.selectUser.select;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.r,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFFDCDCDC),
            width: 0.5.r,
          ),
        ),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            _select = !_select;
          });
          widget.selectUser.select = _select;
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          foregroundColor: const MaterialStatePropertyAll<Color>(Colors.black),
          backgroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.r),
              child: _select
                  ? Icon(
                      Icons.check_circle,
                      color: const Color(0xFFADD8E6),
                      size: 20.r,
                    )
                  : Icon(
                      Icons.radio_button_unchecked,
                      color: const Color(0xFFADD8E6),
                      size: 20.r,
                    ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5.r, right: 10.r),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: Image.asset(
                  widget.selectUser.user.profilePicture!,
                  width: 24.r,
                  height: 24.r,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "${widget.selectUser.user.name}",
              style: TextStyle(
                fontSize: 13.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
