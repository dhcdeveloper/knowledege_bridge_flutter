import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../dao/user_controller_test.dart';

class SexPage extends StatefulWidget {
  const SexPage({super.key});

  @override
  _SexPageState createState() => _SexPageState();
}

class _SexPageState extends State<SexPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedSex;
  late Future<User> _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = UserControllerTest.getUserFromJson();
  }

  Future<void> _submit(User user) async {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedSex == '男') {
        user.sex = 2;
      } else if (_selectedSex == '女') {
        user.sex = 1;
      }
      await UserControllerTest.setUserInJson2(user);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('性别已更新')),
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
        title: const Text('编辑性别'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.check,
              color: Colors.blue,
            ),
            onPressed: () async {
              final user = await _userFuture;
              _submit(user);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<User>(
          future: _userFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('错误: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              User user = snapshot.data!;
              _selectedSex = _selectedSex ?? (user.sex == 1 ? '女' : '男'); // 只在第一次初始化时设置
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropdownButtonFormField<String>(
                        value: _selectedSex,
                        decoration: const InputDecoration(
                          labelText: '性别',
                          border: OutlineInputBorder(),
                        ),
                        items: <String>['男', '女'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedSex = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '请选择性别';
                          }
                          return null;
                        },
                        dropdownColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: Text('没有数据'));
            }
          },
        ),
      ),
    );
  }
}
