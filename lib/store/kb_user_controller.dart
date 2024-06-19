import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {

  var response = ''.obs;
  var isLoading = false.obs;

  //  user login
  void loginPostRequest(Map<String, dynamic> data) async {
    const url = 'http://your-server.com/api/post';
    try {
      isLoading(true);
      // post request interface
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        this.response.value = response.body;
      } else {
        Get.snackbar('Error', 'Failed to send data');
      }

    } catch (e) {
      Get.snackbar('Error', 'Failed to send data');
    } finally {
      isLoading(false);
    }

  }

  // user create
  void createUserPostRequest(Map<String, dynamic> data) async {
    const url = 'http://your-server.com/api/post';
    try {
      isLoading(true);
      // post request interface
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        this.response.value = response.body;
      } else {
        Get.snackbar('Error', 'Failed to send data');
      }

    } catch (e) {
      Get.snackbar('Error', 'Failed to send data');
    } finally {
      isLoading(false);
    }

  }

  // user password update
  // sex age birthday......
  void updateUserPostRequest(Map<String, dynamic> data) async {
    const url = 'http://your-server.com/api/post';
    try {
      isLoading(true);
      // post request interface
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        this.response.value = response.body;
      } else {
        Get.snackbar('Error', 'Failed to send data');
      }

    } catch (e) {
      Get.snackbar('Error', 'Failed to send data');
    } finally {
      isLoading(false);
    }

  }
}