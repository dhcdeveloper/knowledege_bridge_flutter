import 'package:get/get.dart';
import 'package:knowledege_bridge_flutter/pages/kb_login_page.dart';
import '../pages/kb_my_home_page.dart';

List<GetPage<dynamic>> route = [
GetPage(name: '/', page: () => const MyHomePage(title: 'this is start page')),
// GetPage(name: '/details', page: () => DetailsPage()),
GetPage(name: '/login', page: () => const LoginPage()),
];