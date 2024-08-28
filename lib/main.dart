import 'package:cat_facts/config/route_config.dart';
import 'package:cat_facts/feature/auth/controller/auth_controller.dart';
import 'package:cat_facts/feature/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthController());
  Get.put(HomeController());
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Cat Facts',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
        useMaterial3: true,
        fontFamily: 'FF Mark Pro',
      ),
      getPages: RouteConfig.routes,
    );
  }
}
