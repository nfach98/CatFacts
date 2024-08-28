import 'package:cat_facts/config/route_config.dart';
import 'package:cat_facts/feature/auth/controller/auth_controller.dart';
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

    return GetNavConfig.fromRoute(RouteConfig.loginRoute);
  }

  Future<bool> checkUser() async {
    final sharedPref = await SharedPreferences.getInstance();
    final username = sharedPref.getString('session_username');
    final password = sharedPref.getString('session_password');

    return username != null && password != null;
  }
}
