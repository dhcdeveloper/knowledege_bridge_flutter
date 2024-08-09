import 'package:flutter/material.dart';
import '../model/user_model.dart';

import '../dao/user_controller_test.dart';


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
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: const Text('登录'),
              onTap: () {
                Navigator.pushNamed(context, "/login");
              },
            ),
            ListTile(
              title: const Text('注册'),
              onTap: () {
                Navigator.pushNamed(context, "/register");
              },
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(220.0),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, size: 20),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
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
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage('lib/images/rabbit.png'),
                            radius: 60,
                          ),
                          const SizedBox(width: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '姓名：${user.name ?? '---'}',
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                '邮箱：${user.email ?? '---'}',
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: Row(
                        children: [
                          const SizedBox(width: 8.0),
                          Container(
                            height: 30,
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              border: Border.all(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: sex
                                  ? const Icon(
                                Icons.face_3,
                                color: Colors.white,
                                size: 16.0,
                              )
                                  : const Icon(
                                Icons.face,
                                color: Colors.white,
                                size: 16.0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Container(
                            height: 30,
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              border: Border.all(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '中国',
                                  style: TextStyle(
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
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
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 16.0,
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  '编辑资料',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16.0),
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
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/setting");
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.blueAccent,
                      size: 16.0,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '设置',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 16.0,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blueAccent,
                      size: 16.0,
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
                  padding: const EdgeInsets.all(16.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.red,
                      size: 16.0,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '退出',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
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
