import 'package:knowledege_bridge_flutter/common/urls_utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key, required this.title});
  final String title;

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _emailText = false;
  bool _obscureText = true;
  bool _obscureText1 = true;
  bool _isValidEmail(String email) {
    final RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.+-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(email);
  }
  ImageProvider<Object>? _image;
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        _image = FileImage(File(imageFile.path));
      });
    }
  }

  Future<void> _register() async {
    if (_formKey.currentState?.validate() ?? false) {
      final response = await http.post(
        Uri.parse(Urls.baseUrl+Urls.userRegister),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': _nameController.text,
          'email': _emailController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        print('注册成功');
        print(response.statusCode);
        _nameController.clear();
        _emailController.clear();
        _passwordController.clear();
        _confirmPasswordController.clear();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('注册成功'),
              content: Text('点击确认跳转登录'),
              actions: <Widget>[
                TextButton(
                  child: Text('确定'),
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
                  },
                ),
              ],
            );
          },
        );
      } else if (response.statusCode == 400) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('注册失败'),
              content: Text('请检查您的输入并重试。'),
              actions: <Widget>[
                TextButton(
                  child: Text('确定'),
                  onPressed: () {
                    _emailText = true;
                    _register();
                    Navigator.of(context).pop();
                    _emailText = false;
                  },
                ),
              ],
            );
          },
        );
      } else {
        print('注册失败');
        print(response.statusCode);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('注册失败'),
              content: Text('服务器错误，请稍后重试。'),
              actions: <Widget>[
                TextButton(
                  child: Text('确定'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: _pickImage,
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 80.0,
                        backgroundImage: _image ??  const AssetImage("lib/images/rabbit.png"),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 25.0,
                          backgroundColor: Colors.transparent,
                          child: IconButton(
                            icon: Icon(null),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    labelText: '用户名',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入用户名';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: '邮箱',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入邮箱';
                  }else if (!_isValidEmail(value)) {
                    return '请输入有效的邮箱地址';
                  }else if (_emailText){
                    return '该邮箱已被注册';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: _obscureText,
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: '密码',
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                    });
                  },
                ),
                    suffixIconColor: Colors.grey,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入密码';
                  }else if (value.length < 8) {
                    return '密码长度不得小于8';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: _obscureText1,
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                    labelText: '确认密码',
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText1 ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscureText1 = !_obscureText1;
                          });
                        },
                    ),
                    suffixIconColor: Colors.grey,
                ),
                validator: (value) {
                  if (value != _passwordController.text) {
                    return '密码不匹配';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
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
                    onTap: _register,
                    child: ConstrainedBox(
                      constraints:
                      BoxConstraints.tightFor(height: 45.w, width: 250.w),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8.w, 8.w, 8.w, 8.w),
                          child: DefaultTextStyle(
                            style:
                            TextStyle(color: Colors.white, fontSize: 14.sp),
                            child: const Text("注册"),
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
                      "已有账号？ ",
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        "立即登录",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/login");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
} 