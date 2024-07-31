import 'package:flutter/material.dart';
import 'kb_person_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Knowledge_bridge'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'home',
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
                Navigator.pushNamed(context, "/login");
              },
            ),
            ListTile(
              title: const Text('注册'),
              onTap: () {
                Navigator.pushNamed(context, "/register");
              },
            ),
            ListTile(
              title: const Text('上传'),
              onTap: () {
                Navigator.pushNamed(context, "/upload");
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
                      onPressed: null,
                    ),
                    Text('我的日程',
                      style: TextStyle(
                          fontSize: 8.0,
                          color: Colors.grey,
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
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => PersonPage(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return child;
                            },
                          ),
                        );
                        //Navigator.pushNamed(context, "/person");
                      },
                    ),
                    Text('我',
                      style: TextStyle(
                          fontSize: 8.0,
                          color: Colors.white,
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
