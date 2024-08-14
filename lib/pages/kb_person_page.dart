import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model/user_model.dart';

import '../dao/user_controller_test2.dart';


class PersonPage extends StatefulWidget {
  final VoidCallback onRefresh;

  const PersonPage({super.key, required this.onRefresh});

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(220.r),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          flexibleSpace: FutureBuilder<User>(
            future: _userFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('错误: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                User user = snapshot.data!;
                bool sex = false;
                if (user.sex == 1){
                  sex = true;
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.r),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('lib/images/rabbit.png'),
                            radius: 60.r,
                          ),
                          SizedBox(width: 16.r),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '姓名：${user.name ?? '---'}',
                                style: TextStyle(
                                  fontSize: 20.r,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '邮箱：${user.email ?? '---'}',
                                style: TextStyle(
                                  fontSize: 12.r,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.r, bottom: 10.r),
                      child: Row(
                        children: [
                          SizedBox(width: 8.r),
                          Container(
                            height: 30,
                            padding: EdgeInsets.all(4.r),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              border: Border.all(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: sex
                                  ? Icon(
                                Icons.face_3,
                                color: Colors.white,
                                size: 16.r,
                              )
                                  : Icon(
                                Icons.face,
                                color: Colors.white,
                                size: 16.r,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.r),
                          Container(
                            height: 30,
                            padding: EdgeInsets.all(4.r),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              border: Border.all(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '中国',
                                  style: TextStyle(
                                    fontSize: 12.r,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.r, vertical: 4.r),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: () async {
                              final result = await Navigator.pushNamed(context, "/edit");
                              if (result == true) {
                                widget.onRefresh();
                                _refreshUser();
                              }
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 16.r,
                                ),
                                SizedBox(width: 4.r),
                                Text(
                                  '编辑资料',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.r,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16.r),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(child: Text('没有数据'));
              }
            },
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.r),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.all(16.r),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/setting");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.blueAccent,
                      size: 16.r,
                    ),
                    SizedBox(width: 8.r),
                    Text(
                      '设置',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 16.r,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blueAccent,
                      size: 16.r,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.all(16.r),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.red,
                      size: 16.r,
                    ),
                    SizedBox(width: 8.r),
                    Text(
                      '退出',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16.r,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
