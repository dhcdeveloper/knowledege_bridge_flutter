import 'package:get/get.dart';
import '../pages/kb_my_home_page.dart';

List<GetPage<dynamic>> route = [
GetPage(name: '/', page: () => const MyHomePage(title: 'this is start page')),
// GetPage(name: '/details', page: () => DetailsPage()),
];