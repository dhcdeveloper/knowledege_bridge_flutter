import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';

class JsonUtils {
  final String _fileName;

  JsonUtils(this._fileName);

  Future<String> get _localPath async {
    final directory = kIsWeb
        ? Directory('cache') // 对于Web，使用cache目录
        : await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_fileName');
  }

  Future<String?> readCache() async {
    try {
      final file = await _localFile;
      String jsonString = await file.readAsString();
      return jsonString;
    } catch (e) {
      return null;
    }
  }

  Future<File> writeCache(String jsonString) async {
    final file = await _localFile;
    return file.writeAsString(jsonString);
  }

  Future<int> deleteFile() async {
    final file = await _localFile;
    try {
      // 检查文件是否存在
      if (await file.exists()) {
        // 删除文件
        await file.delete();
        return 0;
      } else {
        return 1;
      }
    } catch (e) {
      // 处理异常
      return 9;
    }
  }

  static Future<bool> saveData(String key, Map<String, dynamic> json) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = await prefs.setString(key, jsonEncode(json));
    return result;
  }

  static Future<String> readData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String result = prefs.getString(key) ?? 'error';
    return result;
  }

  static Future<bool> deleteData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}