import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import '../model/user_model.dart';
import '../dao/user_controller_test2.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
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

  late Future<User> _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = UserControllerTest.getUserFromJson();
  }

  Future<void> _refreshUser() async {
    setState(() {
      _userFuture = UserControllerTest.getUserFromJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('编辑资料'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.r),
          child: Center(
            child: Column(
              key: _formKey,
              children: <Widget>[
                GestureDetector(
                  onTap: _pickImage,
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 80.r,
                          backgroundImage: _image ?? const AssetImage("lib/images/rabbit.png"),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 25.r,
                            backgroundColor: Colors.transparent,
                            child: IconButton(
                              icon: const Icon(null),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FutureBuilder<User>(
                  future: _userFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('错误: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      User user = snapshot.data!;
                      String sex;
                      if (user.sex == 1) {
                        sex = '女';
                      } else {
                        sex = '男';
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 20.r),
                          Container(
                            width: double.infinity,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.all(13.r),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              onPressed: () async {
                                final result = await Navigator.pushNamed(context, "/name");
                                if (result == true) {
                                  _refreshUser();
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '姓名',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 16.r,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    user.name ?? '---',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 16.r
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 3.r),
                          Container(
                            width: double.infinity,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.all(13.r),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              onPressed: () async {
                                final result = await Navigator.pushNamed(context, "/sex");
                                if (result == true) {
                                  _refreshUser();
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '性别',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 16.r,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    sex,
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 16.r,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 3.r),
                          Container(
                            width: double.infinity,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.all(13.r),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              onPressed: () async {
                                final result = await Navigator.pushNamed(context, "/email");
                                if (result == true) {
                                  _refreshUser();
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '邮箱',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 16.r,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    user.email ?? '---',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 16.r,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(child: Text('没有数据'));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
