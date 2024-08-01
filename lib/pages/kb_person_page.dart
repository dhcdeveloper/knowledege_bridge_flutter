import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class SelectedIndexPage extends StatefulWidget {
  const SelectedIndexPage({super.key});

  @override
  State<SelectedIndexPage> createState() => _SelectedIndexPage();
}

class _SelectedIndexPage extends State<SelectedIndexPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    CalendarPage(),
    SharePage(),
    MessagePage(),
    PersonPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              color: Theme.of(context).colorScheme.inversePrimary,
              animationDuration: const Duration(milliseconds: 300),
              items: const <Widget>[
                Icon(Icons.calendar_month, size: 30, color: Colors.white),
                Icon(Icons.handshake, size: 30, color: Colors.white),
                Icon(Icons.mail, size: 30, color: Colors.white),
                Icon(Icons.person, size: 30, color: Colors.white),
              ],
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('我的日程'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                '我的日程',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SharePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text('共享页面'),
        ),
      ),
    );
  }
}

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text('消息页面'),
        ),
      ),
    );
  }
}

class PersonPage extends StatelessWidget {
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
        preferredSize: Size.fromHeight(250.0),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu, size: 20),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('lib/images/rabbit.png'),
                      radius: 60,
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tom',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '123@dhc.com.cn',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '通信业务二部',
                          style: TextStyle(
                            fontSize: 16.0,
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
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '点击这里 填写简介',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.face_3,
                          color: Colors.white,
                          size: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      height: 30,
                      padding: const EdgeInsets.all(4.0),
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
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text('我的页面'),
        ),
      ),
    );
  }
}
