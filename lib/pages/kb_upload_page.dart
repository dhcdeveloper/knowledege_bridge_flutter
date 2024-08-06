import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knowledege_bridge_flutter/common/pickfile_utils.dart';
import 'package:knowledege_bridge_flutter/dao/upload_controller.dart';
import 'package:knowledege_bridge_flutter/model/user_model.dart';
import 'package:knowledege_bridge_flutter/widgets/head_portrait_widget.dart';
import 'package:knowledege_bridge_flutter/widgets/upload_widget.dart';

import '../common/permission_utils.dart';
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

  //分享给谁信息
  final List<Widget> _shareList = [];

  //上传信息
  late final List<Widget> _uploadMessageList;

  //分割线
  static final Widget _itemSeparator = Container(
    height: 1.0,
    color: Colors.grey.shade400,
  );

  //test
  User user = User();

  @override
  initState() {
    super.initState();
    //添加文件按钮
    _uploadWidgetList.add(
      InkWell(
        onTap: () {
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
    _uploadMessageList = [
      _itemSeparator,
    ];

    //test
    setState(() {
      user.profilePicture = 'lib/images/rabbit.png';
      user.name = '张三';
    });
  }

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
      _uploadWidgetList.insert(_uploadWidgetList.length - 1, UploadWidget(file: file!));
      //添加文件
      _uploadList.add(file);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
                      // return _uploadMessageList[index];
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "填写标题会有更多赞哦~",
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: TextField(
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
                                Object? result = await Navigator.pushNamed(context, '/shareSelect');
                                if (result is List<User>) {
                                  List<User> selecteUserList = result;
                                  setState(() {
                                    for (User user in selecteUserList) {
                                      _shareWidgetList.add(HeadPortraitWidget(user: user,));
                                    }
                                  });
                                }
                              },
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 50.w,
                                      child: Icon(
                                        Icons.group,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w),
                                      height: 50.w,
                                      child: Center(
                                        child: Text('共享给谁'),
                                      ),
                                    ),
                                    Container(
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
                          ),
                          Container(
                            height: 50.w,
                          ),
                        ],
                      );
                    },
                    // childCount: _uploadMessageList.length,
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
                color: Theme.of(context).colorScheme.inversePrimary,
                padding: EdgeInsets.fromLTRB(120.w, 5.w, 10.w, 5.w),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('发布'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
