import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../dao/user_controller_test2.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  Future<void> _submit(User user) async {
    if (_formKey.currentState?.validate() ?? false) {
      user.name = _nameController.text;
      await UserControllerTest.setUserInJson2(user);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('名字已更新')),
      );
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('编辑名字'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.check,
              color: Colors.blue,
            ),
            onPressed: () async {
              final user = await UserControllerTest.getUserFromJson();
              _submit(user);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder<User>(
            future: UserControllerTest.getUserFromJson(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('错误: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                User user = snapshot.data!;
                _nameController.text = user.name ?? '';
                return Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: '名字',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '名字不能为空';
                        }
                        return null;
                      },
                    ),
                  ),
                );
              } else {
                return const Center(child: Text('没有数据'));
              }
            },
          ),
        ),
      ),
    );
  }
}
