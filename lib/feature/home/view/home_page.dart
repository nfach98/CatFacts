import 'package:cat_facts/feature/auth/controller/auth_controller.dart';
import 'package:cat_facts/feature/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Facts'),
        actions: [
          IconButton(
            onPressed: () {
              Get.find<AuthController>().logout();
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: controller.obx(
        (state) {
          final list = state ?? [];
          return ListView.separated(
            padding: EdgeInsets.all(16),
            itemCount: list.length,
            itemBuilder: (_, index) {
              final user = list[index];

              return Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        user.image ?? '',
                        width: 36,
                        height: 36,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${user.firstName ?? ''} ${user.lastName ?? ''}',
                          ),
                          Text(
                            user.email ?? '',
                          ),
                          Text(
                            user.phone ?? '',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) => SizedBox(height: 12),
          );
        },
        onLoading: Center(child: CircularProgressIndicator()),
        onError: (error) {
          return Center(
            child: Text(error ?? ''),
          );
        },
        onEmpty: Center(child: Text('empty')),
      ),
    );
  }
}
