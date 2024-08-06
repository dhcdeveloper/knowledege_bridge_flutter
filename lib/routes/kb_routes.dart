import 'package:get/get.dart';
import 'package:knowledege_bridge_flutter/pages/kb_login_page.dart';
import '../pages/kb _register_page.dart';
import '../pages/kb_home_page.dart';
import '../pages//kb_splash_screen_page.dart';
import '../pages/kb_share_select_page.dart';
import '../pages/kb_upload_page.dart';
import '../pages/kb_setting_page.dart';
import '../pages/kb_edit_page.dart';
import '../pages/kb_name_page.dart';
import '../pages/kb_sex_page.dart';
import '../pages/kb_email_page.dart';

List<GetPage<dynamic>> route = [
  GetPage(name: '/', page: () => SplashScreen()),
  GetPage(name: '/register', page: () => const RegistrationPage()),
  GetPage(name: '/login', page: () => const LoginPage()),
  GetPage(name: '/upload', page: () => const UploadPage()),
  GetPage(name: '/select', page: () => const SelectedIndexPage()),
  GetPage(name: '/setting', page: () => const SettingPage()),
  GetPage(name: '/edit', page: () => const EditPage()),
  GetPage(name: '/name', page: () => const NamePage()),
  GetPage(name: '/sex', page: () => const SexPage()),
  GetPage(name: '/email', page: () => const EmailPage()),
  GetPage(name: '/shareSelect', page: () => const ShareSelectPage()),
];


