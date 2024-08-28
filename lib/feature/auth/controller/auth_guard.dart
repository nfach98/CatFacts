import 'package:cat_facts/feature/auth/controller/auth_controller.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGuard extends GetMiddleware {
  final authController = Get.find<AuthController>();

  @override
  int? get priority => 0;

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    final isAuth = await checkUser();
    if (isAuth) {
      return await super.redirectDelegate(route);
    }

    return GetNavConfig.fromRoute('/login');
  }

  Future<bool> checkUser() async {
    final sharedPref = await SharedPreferences.getInstance();
    final username = sharedPref.getString('session_username');
    final password = sharedPref.getString('session_password');

    return username != null;
  }
}
