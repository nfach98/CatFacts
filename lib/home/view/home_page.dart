import 'package:cat_facts/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Facts'),
      ),
      body: controller.obx(
        (state) {
          return Column(children: []);
        },
        onLoading: Center(child: CircularProgressIndicator()),
        onError: (error) {
          return Center(
            child: Text(error ?? ''),
          );
        },
      ),
    );
  }
}
