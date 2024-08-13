import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../model/select_user.dart';
import '../widgets/select_user_widget.dart';

class ShareSelectPage extends StatefulWidget {
  const ShareSelectPage({super.key});

  @override
  State<ShareSelectPage> createState() => _ShareSelectPageState();
}

class _ShareSelectPageState extends State<ShareSelectPage> {
  //所有的用户信息（包含是否选中）
  List<SelectUser> _selectUserList = [];

  //所有的用户画面列表
  final List<Widget> _userWidgetList = [];

  //搜索用户名
  String searchText = '';

  @override
  initState() {
    super.initState();

    //获取路由传值
    _selectUserList = Get.arguments['selectUserList'];

    //更新展示的用户画面列表
    _updateSelectList();
  }

  //更新展示的用户画面列表
  _updateSelectList() {
    //清空列表
    _userWidgetList.clear();

    int? group;
    for (SelectUser selectUser in _selectUserList) {
      //根据用户组对用户分类
      if (group == null || group != selectUser.user.group) {
        group = selectUser.user.group!;
        //如果搜索内容为空则显示用户的分组，否则不显示（显示空Container占位）
        if (searchText == '') {
          _userWidgetList.add(
            Container(
              color: const Color(0xFFF5F5F5),
              padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
              child: Text(
                selectUser.user.group == 1
                    ? '通信一部'
                    : selectUser.user.group == 2
                        ? '通信二部'
                        : '通信三部',
                style: TextStyle(
                  color: const Color(0xFF808080),
                  fontSize: 12.r,
                ),
              ),
            ),
          );
        } else {
          _userWidgetList.add(Container());
        }
      }
      //搜索内容为空时显示全部用户，不为空时显示用户名匹配的用户，不匹配的用户不显示（显示空Container占位）
      if (searchText == '' || selectUser.user.name!.contains(searchText)) {
        _userWidgetList.add(SelectUserWidget(selectUser: selectUser));
      } else {
        _userWidgetList.add(Container());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var customBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFD3D3D3)),
    );

    var focusedBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF4682B4)),
    );

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
            const Text('共享给谁'),
            ElevatedButton(
              onPressed: () {
                //通过路由传值将选择的用户传给上传页面
                Navigator.pop(context, _selectUserList);
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(Size.zero),
                padding: MaterialStateProperty.all(EdgeInsets.all(5.r)),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 30.r,
                width: 60.r,
                child: Text(
                  '确定',
                  style: TextStyle(
                    fontSize: 16.r,
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
            toolbarHeight: 50.r,
            backgroundColor: const Color(0xFFF5F5F5),
            title: Container(
              height: 40.r,
              padding: EdgeInsets.symmetric(vertical: 2.r),
              child: TextField(
                style: TextStyle(
                  fontSize: 14.r,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "搜索",
                  hintStyle: TextStyle(
                    fontSize: 14.r,
                  ),
                  prefixIcon: const Icon(Icons.search_rounded),
                  border: customBorder,
                  enabledBorder: customBorder,
                  focusedBorder: focusedBorder,
                  contentPadding: EdgeInsets.all(5.r),
                ),
                onChanged: (String text) {
                  setState(() {
                    searchText = text;
                  });
                  //更新用户列表
                  _updateSelectList();
                },
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1.r),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5.r),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _userWidgetList[index];
              },
              childCount: _userWidgetList.length,
            ),
          ),
        ],
      ),
    );
  }
}
