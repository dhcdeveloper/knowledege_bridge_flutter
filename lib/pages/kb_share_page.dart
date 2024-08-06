import 'package:flutter/material.dart';

class SharePage extends StatelessWidget {
  SharePage({super.key});

  List tabs = ["全部", "我发出的"];

  @override
  Widget build(BuildContext context) {
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
                onTap: () {
                  Navigator.pushNamed(context, '/upload');
                },
              ),
              const PopupMenuItem<String>(
                value: 'Item 2',
                child: Text('Item 2'),
              ),
              const PopupMenuItem<String>(
                value: 'Item 3',
                child: Text('Item 3'),
              ),
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
                tabs: tabs.map((e) => Tab(text: e)).toList(),
              ),
            ),
            Expanded(
              flex: 10,
              child: TabBarView(
                //构建
                children: tabs.map((e) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(e, textScaleFactor: 5),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
