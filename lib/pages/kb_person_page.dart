import 'package:flutter/material.dart';
import 'kb_my_home_page.dart';
import 'kb _register.page.dart';
import 'kb_login_page.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('个人'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '个人',
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        width: 200,
        child: ListView(
          children: [
            ListTile(
              title: const Text('登录'),
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return child;
                    },
                  ),
                );
                //Navigator.pushNamed(context, "/login");
              },
            ),
            ListTile(
              title: const Text('注册'),
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return child;
                    },
                  ),
                );
                //Navigator.pushNamed(context, "/register");
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 83,
        color: Theme.of(context).colorScheme.inversePrimary,
        notchMargin: 8.0,
        child: Theme(
          data: ThemeData(
            iconTheme: IconThemeData(color: Colors.white),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.calendar_month, size: 30),
                      iconSize: 30,
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return child;
                            },
                          ),
                        );
                        //Navigator.pushNamed(context, "/home");
                      },
                    ),
                    Text('我的日程',
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.handshake, size: 30),
                      iconSize: 30,
                      onPressed: () {
                      },
                    ),
                    Text('共享',
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.mail, size: 30),
                      iconSize: 30,
                      onPressed: () {
                      },
                    ),
                    Text('消息',
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.person, size: 30),
                      iconSize: 30,
                      onPressed: null,
                    ),
                    Text('我',
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.grey,
                      ),
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
}
