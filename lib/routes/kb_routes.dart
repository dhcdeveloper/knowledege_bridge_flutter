import 'package:get/get.dart';
import 'package:knowledege_bridge_flutter/pages/kb_login_page.dart';
import '../pages/kb_my_home_page.dart';
import '../pages/kb _register.page.dart';
import '../pages/kb_person_page.dart';
import '../pages//kb_splash_screen_page.dart';
import '../pages/kb_upload_page.dart';

List<GetPage<dynamic>> route = [
  GetPage(name: '/', page: () => SplashScreen()),
  GetPage(name: '/home', page: () => const MyHomePage()),
  GetPage(name: '/register', page: () => const RegistrationPage()),
  GetPage(name: '/login', page: () => const LoginPage()),
  GetPage(name: '/upload', page: () => const UploadPage()),
  GetPage(name: '/Select', page: () => const SelectedIndexPage()),
];


