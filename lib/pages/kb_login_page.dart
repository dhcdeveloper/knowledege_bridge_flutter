import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knowledege_bridge_flutter/dao/user_controller.dart';
import 'package:knowledege_bridge_flutter/widgets/TipsWidget.dart';

import '../dao/user_controller_test.dart';
import '../response/base_response.dart';
import '../model/user_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  String _mail = "";
  String _password = "";
  bool _passwordInvisible = true;

  @override
  initState() {
    super.initState();
    //test
    _deleteJson();
  }

  //test
  _deleteJson() async {
    await UserControllerTest.deleteUserInJson();
  }

  @override
  Widget build(BuildContext context) {
    var customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(style: BorderStyle.none),
    );
    var focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(color: Color(0xFFD0D6D9)),
    );
    var errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(color: Color(0xFFC75450)),
    );

    Future showTips(BuildContext context, String tips) async {
      showDialog(context: context, builder: (context) {
        return TipsWidget(content: tips);
      });

      // 使用Timer自动关闭对话框
      await Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context).pop(); // 关闭对话框
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(35.w, 45.w, 35.w, 10.w),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                height: 80.w,
                child: Image(
                  image: const AssetImage("lib/images/logo.png"),
                  height: 60.w,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                height: 35.w,
                child: Text(
                  "您好，",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                height: 45.w,
                child: Text(
                  "欢迎来到KB",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 20.w,
                child: Text(
                  "邮箱",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 65.w,
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "输入您的邮箱",
                    hintStyle: TextStyle(
                      color: const Color(0xFFD0D6D9),
                      height: 1.75.w,
                      fontSize: 14.sp,
                    ),
                    errorStyle: TextStyle(
                      color: const Color(0xFFC75450),
                      fontSize: 10.sp,
                      height: 0.25.w,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF2FCFD),
                    border: customBorder,
                    enabledBorder: customBorder,
                    focusedBorder: focusedBorder,
                    focusedErrorBorder: errorBorder,
                    errorBorder: errorBorder,
                    contentPadding: EdgeInsets.fromLTRB(15.w, 10.w, 15.w, 10.w),
                  ),
                  onSaved: (v) {
                    setState(() {
                      _mail = v.toString();
                    });
                  },
                  validator: (v) {
                    String regexEmail =
                        "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
                    if (v!.trim().isEmpty) {
                      return "邮箱不能为空";
                    } else if (!RegExp(regexEmail).hasMatch(v)) {
                      return "请输入正确的邮箱";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 20.w,
                child: Text(
                  "密码",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 65.w,
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "输入密码",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordInvisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 25.r,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordInvisible = !_passwordInvisible;
                        });
                      },
                    ),
                    suffixIconColor: Colors.grey,
                    hintStyle: TextStyle(
                      color: const Color(0xFFD0D6D9),
                      fontSize: 14.sp,
                      height: 1.75.w,
                    ),
                    errorStyle: TextStyle(
                      color: const Color(0xFFC75450),
                      fontSize: 10.sp,
                      height: 0.25.w,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF2FCFD),
                    border: customBorder,
                    enabledBorder: customBorder,
                    focusedBorder: focusedBorder,
                    focusedErrorBorder: errorBorder,
                    errorBorder: errorBorder,
                    contentPadding: EdgeInsets.fromLTRB(15.w, 10.w, 15.w, 10.w),
                  ),
                  obscureText: _passwordInvisible,
                  onSaved: (v) {
                    setState(() {
                      _password = v.toString();
                    });
                  },
                  validator: (v) {
                    return v!.trim().isNotEmpty ? null : "密码不能为空";
                  },
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                height: 30.w,
                child: InkWell(
                  child: Text(
                    "忘记密码",
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 10.sp,
                      height: 1.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    print("忘记密码");
                  },
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFF1CAFFC),
                      Color(0xFF027BFD),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFDFF4FF),
                      offset: Offset(3.w, 3.w),
                      blurRadius: 5.r,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(25.r),
                    onTap: () async {
                      if ((_formKey.currentState as FormState).validate()) {
                        (_formKey.currentState as FormState).save();
                        // BaseResponse<User> response = await UserController.userLogin(_mail, _password);
                        // if (!context.mounted) return;
                        // if (response.response == 0) {
                        //   await showTips(context, response.errorText!);
                        // } else {
                        //   await showTips(context, "登录成功");
                        //   if (!context.mounted) return;
                        //   Navigator.pushNamedAndRemoveUntil(context, "/home", (Route<dynamic> route) => false);
                        // }

                        //test
                        if (_mail == '3333@qq.com') {
                          await showTips(context, '邮箱不存在!');
                        } else if (_mail == '4444@qq.com') {
                          await showTips(context, '密码不正确!');
                        } else {
                          User user = User();
                          user.email = _mail;
                          user.name = '用户10086';
                          bool res = await UserControllerTest.setUserInJson(user);
                          if (!context.mounted) return;
                          if (res) {
                            await showTips(context, "登录成功");
                            if (!context.mounted) return;
                            Navigator.pushNamedAndRemoveUntil(context, "/home", (Route<dynamic> route) => false);
                          } else {
                            await showTips(context, "发生错误！");
                          }
                        }
                      }
                    },
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(height: 45.w, width: 250.w),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8.w, 8.w, 8.w, 8.w),
                          child: DefaultTextStyle(
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.sp),
                            child: const Text("登录"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 20.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "还没有账号？",
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        "立即注册",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.popAndPushNamed(context, "/register");
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(bottom: 10.w),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "登录即表示同意APP",
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          "《用户协议》",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          print("《用户协议》");
                        },
                      ),
                      Text(
                        "&",
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          "《服务条款》",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          print("《服务条款》");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
