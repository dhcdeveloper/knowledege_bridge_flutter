import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:knowledege_bridge_flutter/dao/upload_controller_test.dart';
import 'package:knowledege_bridge_flutter/dao/user_controller_test.dart';
import 'package:knowledege_bridge_flutter/model/share_content.dart';
import 'package:knowledege_bridge_flutter/model/user_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knowledege_bridge_flutter/widgets/loading_widget.dart';

import '../widgets/share_card_widget.dart';

class SharePage extends StatefulWidget {
  const SharePage({super.key});

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  //导航标题
  final List _tabs = ["全部", "我发出的"];

  //所有的共享文件
  final List<ShareContent> _allShareContents = [];

  //我的的共享文件
  final List<ShareContent> _myShareContents = [];

  //是否正在加载
  bool isLoading = false;

  @override
  initState() {
    super.initState();

    //获取上传文件假后台
    testDataInit();
  }

  //获取上传文件假后台
  testDataInit() async {
    setState(() {
      isLoading = true;
    });

    _allShareContents.clear();
    _myShareContents.clear();

    DateTime now = DateTime.now();

    User user1 = User();
    user1.id = 10086;
    user1.name = "张三1";
    user1.email = "1@qq.com";
    user1.group = 1;
    user1.sex = 1;
    user1.birthday = "20240401";
    user1.profilePicture = "lib/images/rabbit.png";
    user1.createdAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    user1.updatedAt = 0;
    user1.deletedAt = 0;

    User user2 = User();
    user2.id = 10087;
    user2.name = "张三2";
    user2.email = "2@qq.com";
    user2.group = 1;
    user2.sex = 1;
    user2.birthday = "20240401";
    user2.profilePicture = "lib/images/rabbit.png";
    user2.createdAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    user2.updatedAt = 0;
    user2.deletedAt = 0;

    User user3 = User();
    user3.id = 10088;
    user3.name = "张三3";
    user3.email = "3@qq.com";
    user3.group = 1;
    user3.sex = 1;
    user3.birthday = "20240401";
    user3.profilePicture = "lib/images/rabbit.png";
    user3.createdAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    user3.updatedAt = 0;
    user3.deletedAt = 0;

    User user4 = User();
    user4.id = 10089;
    user4.name = "张三4";
    user4.email = "4@qq.com";
    user4.group = 1;
    user4.sex = 1;
    user4.birthday = "20240401";
    user4.profilePicture = "lib/images/rabbit.png";
    user4.createdAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    user4.updatedAt = 0;
    user4.deletedAt = 0;

    List<User> shareUsers = [user2, user3, user4];

    User my = await UserControllerTest.getUserFromJson();

    _allShareContents.add(ShareContent(
        title: '原生开发',
        mainBody:
            '原生应用程序是指某一个移动平台（比如iOS或安卓）所特有的应用，使用相应平台支持的开发工具和语言，并直接调用系统提供的SDK API。比如Android原生应用就是指使用Java或Kotlin语言直接调用Android SDK开发的应用程序；而iOS原生应用就是指通过Objective-C或Swift语言直接调用iOS SDK开发的应用程序。原生开发有以下主要优势：',
        user: user1,
        shareUsers: shareUsers,
        fileNameList: ['原生开发.txt'],
        filePathList: ['/upload/原生开发.txt'],
        startTime: now.add(const Duration(hours: -7)),
        endTime: now.add(const Duration(hours: 16, minutes: 30)),
        isExpire: false,
        effectiveHour: 16,
        effectiveMinute: 30));

    _allShareContents.add(ShareContent(
        title: '跨平台技术简介',
        mainBody:
            '针对原生开发面临的问题，业界一直都在努力寻找好的解决方案，而时至今日，已经有很多跨平台框架（注意，本书中所指的“跨平台”若无特殊说明，即特指 Android 和 iOS 两个平台），根据其原理，主要分为三类：',
        user: user1,
        shareUsers: shareUsers,
        fileNameList: ['跨平台技术简介.txt'],
        filePathList: ['/upload/跨平台技术简介.txt'],
        startTime: now.add(const Duration(hours: -30)),
        endTime: now.add(const Duration(hours: -8)),
        isExpire: true,
        effectiveHour: 0,
        effectiveMinute: 0));

    _allShareContents.add(ShareContent(
        title: 'H5 + 原生',
        mainBody:
            '这类框架主要原理就是将 App 中需要动态变动的内容通过HTML5（简称 H5）来实现，通过原生的网页加载控件WebView （Android）或 WKWebView（iOS）来加载（以后若无特殊说明，我们用WebView来统一指代 Android 和 iOS 中的网页加载控件）。这种方案中，H5 部分是可以随时改变而不用发版，动态化需求能满足；同时，由于 H5 代码只需要一次开发，就能同时在 Android 和 iOS 两个平台运行，这也可以减小开发成本，也就是说，H5 部分功能越多，开发成本就越小。我们称这种 H5 + 原生 的开发模式为混合开发 ，采用混合模式开发的App我们称之为混合应用或 HTMLybrid App ，如果一个应用的大多数功能都是 H5 实现的话，我们称其为 Web App 。',
        user: user1,
        shareUsers: shareUsers,
        fileNameList: ['H5 + 原生.txt'],
        filePathList: ['/upload/H5 + 原生.txt'],
        startTime: now.add(const Duration(hours: -30)),
        endTime: now.add(const Duration(hours: -8)),
        isExpire: true,
        effectiveHour: 0,
        effectiveMinute: 0));

    //从缓存获取我的共享文件
    ShareContent? shareContent =
        await UploadControllerTest.getShareContentFromJson();
    if (shareContent != null) {
      _myShareContents.add(shareContent);
      _allShareContents.insert(0, shareContent);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    double getEndCardHeight(int cardLength) {
      int maxCardNum = screenHeight ~/ 200.w - 1;
      return cardLength > maxCardNum ? screenHeight % 200.w + 90.w : screenHeight - cardLength * 200.w - 130.w;
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('共享'),
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: const Icon(Icons.add_circle_outline),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'upload',
                child: const Row(
                  children: [
                    Icon(Icons.file_upload),
                    Text('添加文件'),
                  ],
                ),
                onTap: () async {
                  Object? result =
                      await Navigator.pushNamed(context, '/upload');
                  if (result is bool && result) {
                    testDataInit();
                  }
                },
              ),
              // const PopupMenuItem<String>(
              //   value: 'Item 2',
              //   child: Text('Item 2'),
              // ),
              // const PopupMenuItem<String>(
              //   value: 'Item 3',
              //   child: Text('Item 3'),
              // ),
            ],
            onSelected: (String value) {
              print('Selected: $value');
            },
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: TabBar(
                tabs: _tabs.map((e) => Tab(text: e)).toList(),
              ),
            ),
            Expanded(
              flex: 10,
              child: TabBarView(
                //构建
                children: [
                  isLoading
                      ? const LoadingWidget()
                      : _allShareContents.isEmpty
                          ? const Center(
                              child: Text('还没有可查看的文件哦~'),
                            )
                          : ListView.builder(
                              itemCount: _allShareContents.length + 1,
                              itemBuilder: (BuildContext context, int index) {
                                if (index == _allShareContents.length) {
                                  return Container(
                                    alignment: Alignment.topCenter,
                                    padding: EdgeInsets.only(top: 10.w),
                                    height: getEndCardHeight(_allShareContents.length),
                                    color: const Color(0xFFF5F5F5),
                                    child: const Text('没有更多了'),
                                  );
                                } else {
                                  return ShareCardWidget(
                                      shareContent: _allShareContents[index]);
                                }
                              },
                            ),
                  isLoading
                      ? const LoadingWidget()
                      : _myShareContents.isEmpty
                          ? const Center(
                              child: Text('还没有分享文件哦~'),
                            )
                          : ListView.builder(
                              itemCount: _myShareContents.length + 1,
                              itemBuilder: (BuildContext context, int index) {
                                if (index == _myShareContents.length) {
                                  return Container(
                                    alignment: Alignment.topCenter,
                                    padding: EdgeInsets.only(top: 10.w),
                                    height: getEndCardHeight(_myShareContents.length),
                                    color: const Color(0xFFF5F5F5),
                                    child: const Text('没有更多了'),
                                  );
                                } else {
                                  return ShareCardWidget(
                                      shareContent: _myShareContents[index]);
                                }
                              },
                            ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
