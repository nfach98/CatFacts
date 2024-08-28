import 'package:cat_facts/feature/auth/controller/auth_guard.dart';
import 'package:cat_facts/feature/auth/view/login_page.dart';
import 'package:cat_facts/feature/home/view/home_page.dart';
import 'package:get/get.dart';

class RouteConfig {
  static String loginRoute = '/login';
  static String homeRoute = '/';
  static List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => HomePage(),
      middlewares: [AuthGuard()],
    ),
    GetPage(
      name: '/login',
      page: () => LoginPage(),
    ),
  ];
}
