import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:knowledege_bridge_flutter/common/pickfile_utils.dart';
import 'package:knowledege_bridge_flutter/common/show_tips_utils.dart';
import 'package:knowledege_bridge_flutter/dao/upload_controller.dart';
import 'package:knowledege_bridge_flutter/dao/upload_controller_test.dart';
import 'package:knowledege_bridge_flutter/model/user_model.dart';
import 'package:knowledege_bridge_flutter/widgets/head_portrait_widget.dart';
import 'package:knowledege_bridge_flutter/widgets/upload_widget.dart';

import '../common/permission_utils.dart';
import '../model/select_user.dart';
import '../response/base_response.dart';
import '../response/upload_response.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  //上传的文件缩略图
  final List<Widget> _uploadWidgetList = [];

  //上传的文件
  final List<PlatformFile> _uploadList = [];

  //分享给谁缩略图
  final List<Widget> _shareWidgetList = [];

  //所有可分享的用户
  final List<User> _allUserList = [];

  //已经选择的用户
  final List<User> _selectedUserList = [];

  //选择分享的用户
  List<SelectUser> _selectUserList = [];

  //上次选择分享的用户
  final List<SelectUser> _preSelectUserList = [];

  //标题controller
  final TextEditingController _titleController = TextEditingController();

  //正文controller
  final TextEditingController _mainBodyController = TextEditingController();

  @override
  initState() {
    super.initState();
    //添加文件按钮
    _initUploadWidgetList();

    //获取用户假后台
    testDataInit();

    //初始化选择分享的用户
    for (User user in _allUserList) {
      _selectUserList.add(SelectUser(user: user, select: false));
      _preSelectUserList.add(SelectUser(user: user, select: false));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _mainBodyController.dispose();
  }

  //获取用户假后台
  testDataInit() {
    DateTime now = DateTime.now();

    for (int i = 11; i <= 20; i++) {
      User user = User();
      user.id = i;
      user.name = "李四$i";
      user.profilePicture = 'lib/images/rabbit.png';
      user.email = "$i@qq.com";
      user.group = 2;
      user.sex = 1;
      user.birthday = "20240401";
      user.createdAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
      user.updatedAt = 0;
      user.deletedAt = 0;
      _allUserList.add(user);
    }
    for (int i = 1; i <= 10; i++) {
      User user = User();
      user.id = i;
      user.name = "张三$i";
      user.profilePicture = 'lib/images/rabbit.png';
      user.email = "$i@qq.com";
      user.group = 1;
      user.sex = 1;
      user.birthday = "20240401";
      user.createdAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
      user.updatedAt = 0;
      user.deletedAt = 0;
      _allUserList.add(user);
    }
    for (int i = 21; i <= 30; i++) {
      User user = User();
      user.id = i;
      user.name = "王五$i";
      user.profilePicture = 'lib/images/rabbit.png';
      user.email = "$i@qq.com";
      user.group = 3;
      user.sex = 1;
      user.birthday = "20240401";
      user.createdAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
      user.updatedAt = 0;
      user.deletedAt = 0;
      _allUserList.add(user);
    }
    //按照用户组和用户名排序
    _allUserList.sort((User a, User b) {
      int result = a.group!.compareTo(b.group!);
      if (result == 0) {
        result = a.name!.compareTo(b.name!);
      }
      return result;
    });
  }

  //添加文件按钮
  _initUploadWidgetList() {
    _uploadWidgetList.add(
      InkWell(
        onTap: () {
          //读取文件并展示缩略图
          _addFileIntoUploadList();
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: const Color(0xFFD0D0D0),
              width: 1.w,
            ),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  //上传文件
  Future<void> _uploadFile() async {
    await PermissionUtils.requestPermission();
    PlatformFile? file = await PickFileUtils.pickFile();
    BaseResponse<UploadResponse> res =
    await UploadController.uploadFile([file!]);
    print(res.responseData!.message);
  }

  //读取文件并展示缩略图
  _addFileIntoUploadList() async {
    //获取文件权限
    await PermissionUtils.requestPermission();
    //读取文件
    PlatformFile? file = await PickFileUtils.pickFile();
    setState(() {
      //生成缩略图
      _uploadWidgetList.insert(
          _uploadWidgetList.length - 1, UploadWidget(file: file!));
      //添加文件
      _uploadList.add(file);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.all(10.w),
                  sliver: SliverGrid(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 3),
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return _uploadWidgetList[index];
                      },
                      childCount: _uploadWidgetList.length,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: TextField(
                              controller: _titleController,
                              decoration: const InputDecoration(
                                hintText: "填写标题会有更多赞哦~",
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: TextField(
                              controller: _mainBodyController,
                              decoration: InputDecoration(
                                  hintText: "添加正文",
                                  hintStyle: TextStyle(fontSize: 14.sp)),
                              minLines: 5,
                              maxLines: 10,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.w),
                            child: InkWell(
                              onTap: () async {
                                //获取路由返回的选择用户列表
                                Object? result = await Get.toNamed(
                                    '/shareSelect',
                                    arguments: {
                                      'selectUserList': _selectUserList
                                    });
                                //选择共享用户
                                if (result is List<SelectUser>) {
                                  //共享选择用户列表
                                  _selectUserList = result;

                                  //已经被选择的用户
                                  _selectedUserList.clear();
                                  for (SelectUser selectUser in _selectUserList) {
                                    if (selectUser.select) {
                                      _selectedUserList.add(selectUser.user);
                                    }
                                  }

                                  //重新生成上次选择用户列表还原（深拷贝）
                                  _preSelectUserList.clear();
                                  for (SelectUser selectUser in _selectUserList) {
                                    _preSelectUserList.add(SelectUser(
                                        user: selectUser.user,
                                        select: selectUser.select));
                                  }

                                  setState(() {
                                    //分享给谁缩略图列表清空
                                    _shareWidgetList.clear();
                                    for (SelectUser selectUser
                                    in _selectUserList) {
                                      //如果用户被选中，则添加缩略图
                                      if (selectUser.select) {
                                        _shareWidgetList.add(HeadPortraitWidget(
                                            user: selectUser.user));
                                      }
                                    }
                                  });
                                  //取消选择用户
                                } else {
                                  //使用上次选择用户列表还原（深拷贝）
                                  _selectUserList.clear();
                                  for (SelectUser selectUser
                                  in _preSelectUserList) {
                                    _selectUserList.add(SelectUser(
                                        user: selectUser.user,
                                        select: selectUser.select));
                                  }
                                }
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 50.w,
                                    child: const Icon(
                                      Icons.group,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Container(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 5.w),
                                    height: 50.w,
                                    child: const Center(
                                      child: Text('共享给谁'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 249.w,
                                    child: Wrap(
                                      spacing: 5.w,
                                      runSpacing: -10.w,
                                      children: _shareWidgetList,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 50.w,
                          ),
                        ],
                      );
                    },
                    childCount: 1,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Theme
                    .of(context)
                    .colorScheme
                    .inversePrimary,
                padding: EdgeInsets.fromLTRB(120.w, 5.w, 10.w, 5.w),
                child: ElevatedButton(
                  onPressed: () async {
                    String title = _titleController.text;
                    String mainBody = _mainBodyController.text;
                    if (title == '') {
                      ShowTipsUtils.showTips(context, '标题不能为空');
                    } else if (mainBody == '') {
                      ShowTipsUtils.showTips(context, '正文不能为空');
                    } else if (_uploadList.isEmpty) {
                      ShowTipsUtils.showTips(context, '请选择文件');
                    } else if (_selectedUserList.isEmpty) {
                      ShowTipsUtils.showTips(context, '请选择要分享的用户');
                    } else {
                      //test
                      await UploadControllerTest.setShareContentInJson(title, mainBody, _selectedUserList, _uploadList);
                      if (!context.mounted) return;
                      await ShowTipsUtils.showTips(context, "发布成功！");
                      if (!context.mounted) return;
                      Navigator.pop(context, true);
                    }
                  },
                  child: const Text('发布'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
