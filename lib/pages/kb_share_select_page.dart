import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knowledege_bridge_flutter/model/user_model.dart';

import '../widgets/select_user_widget.dart';

class ShareSelectPage extends StatefulWidget {
  const ShareSelectPage({super.key});

  @override
  State<ShareSelectPage> createState() => _ShareSelectPageState();
}

class _ShareSelectPageState extends State<ShareSelectPage> {
  //所有的用户画面列表
  List<Widget> userWidgetList = [];

  //搜索后的用户画面列表
  List<Widget> searchedUserWidgetList = [];

  //所有的用户
  List<User> userList = [];

  //搜索后的用户
  List<User> searchedUserList = [];

  //是否正在搜索
  bool _isSearch = false;

  //搜索内容
  String _searchText = '';

  @override
  initState() {
    super.initState();

    //test
    for (int i = 11; i <= 20; i++) {
      User user = User();
      user.id = i;
      user.name = "李四$i";
      user.profilePicture = 'lib/images/rabbit.png';
      user.group = 2;
      userList.add(user);
    }
    for (int i = 1; i <= 10; i++) {
      User user = User();
      user.id = i;
      user.name = "张三$i";
      user.profilePicture = 'lib/images/rabbit.png';
      user.group = 1;
      userList.add(user);
    }
    for (int i = 21; i <= 30; i++) {
      User user = User();
      user.id = i;
      user.name = "王五$i";
      user.profilePicture = 'lib/images/rabbit.png';
      user.group = 3;
      userList.add(user);
    }

    userList.sort((User a, User b) {
      int result = a.group!.compareTo(b.group!);
      if (result == 0) {
        result = a.name!.compareTo(b.name!);
      }
      return result;
    });

    int? group;
    for (User user in userList) {
      if (group == null || group != user.group) {
        group = user.group!;
        userWidgetList.add(
          Container(
            child: Text("${user.group}"),
          ),
        );
      }
      userWidgetList.add(SelectUserWidget(user: user));
    }
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('共享给谁'),
            Container(
              width: 60.w,
              child: ElevatedButton(
                onPressed: () {
                  List<User> selecteUserList = [];
                  for (Widget widget in userWidgetList) {
                    if (widget is SelectUserWidget) {
                      SelectUserWidget userWidget = widget;
                      if (userWidget.select) {
                        selecteUserList.add(userWidget.user);
                      }
                    }
                  }
                  Navigator.pop(context, selecteUserList);
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(Size.zero),
                  padding: MaterialStateProperty.all(EdgeInsets.all(6.w)),
                ),
                child: Container(
                  child: Text(
                    '发布',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            toolbarHeight: 60.w,
            title: Container(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "搜索",
                  prefixIcon: Icon(Icons.search_rounded),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(5.w),
                ),
                onChanged: (String text) {
                  setState(() {
                    text == '' ? _isSearch = false : _isSearch = true;
                    _searchText = text;
                    searchedUserWidgetList.clear();
                    // searchedUserList.clear();
                    for (Widget widget in userWidgetList) {
                      if (widget is SelectUserWidget) {
                        SelectUserWidget userWidget = widget;
                        if (userWidget.user.name!.contains(text)) {
                          // searchedUserList.add(user);
                          searchedUserWidgetList.add(userWidget);
                        }
                      }
                    }
                  });
                },
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1.w),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5.w),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return _isSearch ? searchedUserWidgetList[index] : userWidgetList[index];
              },
              childCount: _isSearch ? searchedUserWidgetList.length : userWidgetList.length,
                addAutomaticKeepAlives: false,
            ),
          ),
        ],
      ),
    );
  }
}
