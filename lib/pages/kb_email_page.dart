import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../dao/user_controller_test.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  Future<void> _submit(User user) async {
    if (_formKey.currentState?.validate() ?? false) {
      user.email = _emailController.text;
      await UserControllerTest.setUserInJson2(user);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('邮箱已更新')),
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
        title: const Text('编辑邮箱'),
        actions: [
          IconButton(
            icon: Icon(
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
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('错误: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                User user = snapshot.data!;
                _emailController.text = user.email ?? '';
                return Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: '邮箱',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '邮箱不能为空';
                        }
                        return null;
                      },
                    ),
                  ),
                );
              } else {
                return Center(child: Text('没有数据'));
              }
            },
          ),
        ),
      ),
    );
  }
}
